package iit.nstu.bdstocktrendbackend;

import iit.nstu.bdstocktrendbackend.config.Constants;
import iit.nstu.bdstocktrendbackend.dto.response.PredictionResponse;
import iit.nstu.bdstocktrendbackend.service.MarketService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

@SpringBootTest
class BdStockTrendBackendApplicationTests {

    @Autowired
    MarketService marketService;

    @Autowired
    RestTemplate restTemplate;

    @Test
    void contextLoads() {
        marketService.addWebsiteCompanyInfo();
    }

}
