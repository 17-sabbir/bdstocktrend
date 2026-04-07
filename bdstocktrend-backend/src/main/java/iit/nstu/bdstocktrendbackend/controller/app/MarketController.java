package iit.nstu.bdstocktrendbackend.controller.app;

import iit.nstu.bdstocktrendbackend.dto.DashboardDTO;
import iit.nstu.bdstocktrendbackend.service.MarketService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequiredArgsConstructor
public class MarketController {

    private final MarketService marketService;

    @GetMapping("/api/dashboard-statistics")
    public DashboardDTO getDashboardStatistics(){

        DashboardDTO dashboardDTO = new DashboardDTO();

        dashboardDTO.setLastUpdateTime(marketService.getDataUpdateLastTime());
        dashboardDTO.setDseX(marketService.getDseX());
        dashboardDTO.setDseS(marketService.getDseS());
        dashboardDTO.setDs30(marketService.getDs30());
        dashboardDTO.setDseInfo(marketService.getDseInfo());
        dashboardDTO.setTopCompaniesByCategory(marketService.getTopCompaniesByCategory());

        return dashboardDTO;
    }



}
