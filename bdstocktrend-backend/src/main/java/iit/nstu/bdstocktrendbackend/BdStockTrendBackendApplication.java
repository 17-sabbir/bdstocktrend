package iit.nstu.bdstocktrendbackend;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@EnableScheduling
public class BdStockTrendBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(BdStockTrendBackendApplication.class, args);
    }

}
