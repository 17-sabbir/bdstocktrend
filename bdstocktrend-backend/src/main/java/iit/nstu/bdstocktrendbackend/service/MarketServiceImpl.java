package iit.nstu.bdstocktrendbackend.service;

import iit.nstu.bdstocktrendbackend.config.Constants;
import iit.nstu.bdstocktrendbackend.dto.TimeSeriesDTO;
import iit.nstu.bdstocktrendbackend.exception.DataCrawlException;
import iit.nstu.bdstocktrendbackend.models.Company;
import iit.nstu.bdstocktrendbackend.repository.CompanyRepository;
import iit.nstu.bdstocktrendbackend.service.external.ExternalService;
import lombok.RequiredArgsConstructor;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MarketServiceImpl implements MarketService {

    private final CompanyRepository companyRepository;
    private final ExternalService externalService;

    @Override
    public List<TimeSeriesDTO> getDseX() {
        List<TimeSeriesDTO> dseX = new ArrayList<>();
        try {
            Document document = Jsoup
                    .connect(Constants.DSE_URL)
                    .get();

            Elements scripts = document.select("script");
            if(!scripts.isEmpty()){
                String scriptText = scripts.last().data();
                String[] scriptParts = scriptText.split("\n");
                for (String part : scriptParts) {
                    part = part.trim();
                    if(part.startsWith("var index_value_dsbi")){

                        part = part.replace("var index_value_dsbi = ", "")
                                .replaceAll("[\"+;]","")
                                .trim().replaceAll(" ","T");

                        String[] values = part.split("\\\\n");

                        for (String value : values) {
                            String[] data = value.split(",");
                            TimeSeriesDTO timeSeriesDTO = new TimeSeriesDTO();
                            timeSeriesDTO.setTime(LocalDateTime.parse(data[0]));
                            timeSeriesDTO.setValue(Double.parseDouble(data[1]));
                            dseX.add(timeSeriesDTO);
                        }

                    }
                }
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return dseX;
    }

    @Override
    public List<TimeSeriesDTO> getDseS() {

        List<TimeSeriesDTO> dseS = new ArrayList<>();
        try {
            Document document = Jsoup
                    .connect(Constants.DSE_URL)
                    .get();

            Elements scripts = document.select("script");
            if(!scripts.isEmpty()){
                String scriptText = scripts.last().data();
                String[] scriptParts = scriptText.split("\n");
                for (String part : scriptParts) {
                    part = part.trim();
                    if(part.startsWith("var index_value_dses")){

                        part = part.replace("var index_value_dses = ", "")
                                .replaceAll("[\"+;]","")
                                .trim().replaceAll(" ","T");

                        String[] values = part.split("\\\\n");

                        for (String value : values) {
                            String[] data = value.split(",");
                            TimeSeriesDTO timeSeriesDTO = new TimeSeriesDTO();
                            timeSeriesDTO.setTime(LocalDateTime.parse(data[0]));
                            timeSeriesDTO.setValue(Double.parseDouble(data[1]));
                            dseS.add(timeSeriesDTO);
                        }

                    }
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return dseS;
    }

    @Override
    public List<TimeSeriesDTO> getDs30() {

        List<TimeSeriesDTO> ds30 = new ArrayList<>();
        try {
            Document document = Jsoup
                    .connect(Constants.DSE_URL)
                    .get();

            Elements scripts = document.select("script");
            if(!scripts.isEmpty()){
                String scriptText = scripts.last().data();
                String[] scriptParts = scriptText.split("\n");
                for (String part : scriptParts) {
                    part = part.trim();
                    if(part.startsWith("var index_value_ds30")){

                        part = part.replace("var index_value_ds30 = ", "")
                                .replaceAll("[\"+;]","")
                                .trim().replaceAll(" ","T");

                        String[] values = part.split("\\\\n");

                        for (String value : values) {
                            String[] data = value.split(",");
                            TimeSeriesDTO timeSeriesDTO = new TimeSeriesDTO();
                            timeSeriesDTO.setTime(LocalDateTime.parse(data[0]));
                            timeSeriesDTO.setValue(Double.parseDouble(data[1]));
                            ds30.add(timeSeriesDTO);
                        }

                    }
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return ds30;
    }

    @Override
    public String getDataUpdateLastTime() {
        try {
            Document document = Jsoup
                .connect(Constants.DSE_URL)
                .get();

            Element element = document.select(".containbox .content .Bodyheading").first();

            return element.text();

        } catch (Exception e) {
            throw new DataCrawlException(e.getMessage());
        }
    }

  @Override
  public Object getDseInfo() {
    return externalService.getDseInfo();
  }

  public void getCompanyInfo(){

        try {
            ArrayList<Company> companies = new ArrayList<>();

            for (String url : Constants.SECTOR_WISE_COMPANY_LIST) {
                Document document = Jsoup
                        .connect(url)
                        .get();

                String sector=null;
                Elements nameElement = document.select("h2.BodyHead.topBodyHead");
                if(!nameElement.isEmpty()){
                    sector=nameElement.text().split(":")[1].trim();
                }

                ArrayList<Company> sectorWise = new ArrayList<>();

                Elements table = document.select("table.table.table-borderless.background-white");
                if(!table.isEmpty()){
                    String[] data = table
                            .select("td")
                            .eachText()
                            .get(0)
                            .split(" \\)");

                    for (String datum : data) {
                        String[] info = datum.split(" \\( ");
                        Company company = new Company();
                        company.setSector(sector);
                        company.setCode(info[0].trim());
                        company.setName(info[1].trim());

                        sectorWise.add(company);
                    }

                }

                companies.addAll(sectorWise);
            }

            companyRepository.saveAll(companies);


        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

  public void addWebsiteCompanyInfo(){
        List<Company> companies = companyRepository.findAll();
        for (Company company : companies) {

            try {
                Document document = Jsoup
                        .connect(Constants.DSE_URL+Constants.COMPANY_INFO+"?name="+company.getCode())
                        .get();

                Element addressTable = document.select("table#company")
                        .last();

                String website = addressTable
                        .select("a.ab1")
                        .last()
                        .attribute("href")
                        .getValue();

                company.setWebsite(website);

                companyRepository.save(company);

            }catch (Exception e){
                System.out.println("Failed for "+company.getCode());
                System.out.println(e.getMessage());
            }

        }
    }

    @Override
    public Object getTopCompaniesByCategory() {
        return externalService.getTopCompaniesByCategory();
    }
}
