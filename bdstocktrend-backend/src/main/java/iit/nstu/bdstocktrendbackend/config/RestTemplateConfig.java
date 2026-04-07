package iit.nstu.bdstocktrendbackend.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestTemplateConfig {

    @Value("${bdstocktrend.engine.token}")
    private String xToken;

    @Bean
    public RestTemplate getRestTemplate(){
        RestTemplate restTemplate = new RestTemplate();

        // Add a request interceptor to include token in request headers
        restTemplate.getInterceptors().add((ClientHttpRequestInterceptor) (request, body, execution) -> {
            request.getHeaders().add("Authorization", xToken);
            return execution.execute(request, body);
        });

        return restTemplate;
    }
}
