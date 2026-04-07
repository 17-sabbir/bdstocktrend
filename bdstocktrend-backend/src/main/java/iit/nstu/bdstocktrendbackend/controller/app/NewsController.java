package iit.nstu.bdstocktrendbackend.controller.app;

import iit.nstu.bdstocktrendbackend.dto.NewsDTO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class NewsController {

    private static final Logger log = LoggerFactory.getLogger(NewsController.class);

    @GetMapping("/api/news")
    public List<NewsDTO> getNews(){

        ArrayList<NewsDTO> newsDTOList = new ArrayList<>();
        try {

            Document doc = Jsoup.connect("https://www.dsebd.org/old_news.php?inst=1JANATAMF&startDate=2024-03-01&endDate=2024-04-06&criteria=4&archive=news").get();

            Element table = doc.select("table.table-news").first();

            if(table != null){

                NewsDTO newsDto = new NewsDTO();

                for (Element row : table.select("tr")) {
                    Elements heads = row.select("th");
                    Elements cols = row.select("td");
                    if(!cols.isEmpty()){
                        if(heads.get(0).text().trim().equals("News Title:")){
                            newsDto.setTitle(cols.get(0).text().trim());
                        } else if(heads.get(0).text().trim().equals("News:")){
                            newsDto.setDescription(cols.get(0).text().trim());
                        } else if(heads.get(0).text().trim().equals("Post Date:")){
                            newsDto.setDate(cols.get(0).text().trim());
                            newsDTOList.add(newsDto);
                            newsDto = new NewsDTO();
                        }
                    }
                }
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return newsDTOList;
    }
}
