package iit.nstu.bdstocktrendbackend.controller.test;

import iit.nstu.bdstocktrendbackend.config.Constants;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequiredArgsConstructor
@RequestMapping("")
public class VersionController {

    public final RestTemplate restTemplate;

    @GetMapping("/")
    public String get(){
        return "BDStockTrend version 0.2 running";
    }

    @GetMapping("/backend")
    public String getVersion(){
        return "0.2";
    }

    @GetMapping("/version/engine")
    public String getEngineVersion(){
        return restTemplate.getForObject(Constants.ENGINE_URL+"/", String.class);
    }
}
