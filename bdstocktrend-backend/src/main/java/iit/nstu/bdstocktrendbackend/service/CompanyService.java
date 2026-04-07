package iit.nstu.bdstocktrendbackend.service;

import iit.nstu.bdstocktrendbackend.dto.CompanyDTO;
import iit.nstu.bdstocktrendbackend.dto.TimeSeriesDTO;

import java.util.List;

public interface CompanyService {

    List<CompanyDTO> getCompanies();

    List<TimeSeriesDTO> last30daysData(String code);
    List<TimeSeriesDTO> next30daysData(String code);
}
