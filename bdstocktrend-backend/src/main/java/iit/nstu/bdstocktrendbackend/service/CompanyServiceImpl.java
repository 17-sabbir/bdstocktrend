package iit.nstu.bdstocktrendbackend.service;

import iit.nstu.bdstocktrendbackend.dto.CompanyDTO;
import iit.nstu.bdstocktrendbackend.dto.TimeSeriesDTO;
import iit.nstu.bdstocktrendbackend.models.Prediction;
import iit.nstu.bdstocktrendbackend.repository.CompanyRepository;
import iit.nstu.bdstocktrendbackend.repository.PredictionRepository;
import iit.nstu.bdstocktrendbackend.repository.StockRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{

    private final CompanyRepository companyRepository;
    private final StockRepository stockRepository;
    private final PredictionRepository predictionRepository;
    private final ModelMapper modelMapper;

    @Override
    public List<CompanyDTO> getCompanies() {
        return companyRepository.findAll()
                .stream()
                .map(company -> modelMapper.map(company,CompanyDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<TimeSeriesDTO> last30daysData(String code) {
        List<TimeSeriesDTO> list = stockRepository.getLast30daysByCode(code)
                .stream()
                .map(stock -> {
            TimeSeriesDTO timeSeriesDTO = new TimeSeriesDTO();
            timeSeriesDTO.setTime(stock.getDate().atTime(LocalTime.MIDNIGHT));
            timeSeriesDTO.setValue(stock.getClose());
            return timeSeriesDTO;
        }).collect(Collectors.toList());

        list.sort((o1, o2) -> o1.getTime().compareTo(o2.getTime()));

        return list;
    }

    @Override
    public List<TimeSeriesDTO> next30daysData(String code) {
        return predictionRepository.getNext30daysByCode(code)
                .stream()
                .map(stock -> {
                    TimeSeriesDTO timeSeriesDTO = new TimeSeriesDTO();
                    timeSeriesDTO.setTime(stock.getDate().atTime(LocalTime.MIDNIGHT));
                    timeSeriesDTO.setValue(stock.getClose());
                    return timeSeriesDTO;
                }).collect(Collectors.toList());
    }
}
