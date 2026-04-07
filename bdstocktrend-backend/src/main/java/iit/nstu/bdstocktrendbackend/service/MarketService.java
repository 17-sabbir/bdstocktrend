package iit.nstu.bdstocktrendbackend.service;

import iit.nstu.bdstocktrendbackend.dto.TimeSeriesDTO;

import java.util.List;

public interface MarketService {

    List<TimeSeriesDTO> getDseX();

    List<TimeSeriesDTO> getDseS();

    List<TimeSeriesDTO> getDs30();

    String getDataUpdateLastTime();

    Object getDseInfo();


    void getCompanyInfo();
    void addWebsiteCompanyInfo();

    Object getTopCompaniesByCategory();

}
