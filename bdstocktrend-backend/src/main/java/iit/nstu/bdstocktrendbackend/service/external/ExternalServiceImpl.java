package iit.nstu.bdstocktrendbackend.service.external;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@RequiredArgsConstructor
@Slf4j
public class ExternalServiceImpl implements ExternalService {

  private final RestTemplate restTemplate;

  @Override
  public Object getCompanyInfo(String code){
    try {

      var res =  restTemplate.getForEntity("https://www.amarstock.com/data/1258dca00155/{code}", Object.class, code);
      return res.getBody();

    } catch (Exception e){
      log.error(e.getMessage());
    }

    return null;
  }

  @Override
  public Object getDseInfo(){
    try {

      var res =  restTemplate.getForEntity("https://www.amarstock.com/Info/DSE", Object.class);
      return res.getBody();

    } catch (Exception e){
      log.error(e.getMessage());
    }

    return null;
  }

  @Override
  public Object getTopCompaniesByCategory(){
    try {

      var res =  restTemplate.getForEntity("https://www.amarstock.com/Home/MostActiveBlockEx", Object.class);
      return res.getBody();

    } catch (Exception e){
      log.error(e.getMessage());
    }

    return null;
  }

}
