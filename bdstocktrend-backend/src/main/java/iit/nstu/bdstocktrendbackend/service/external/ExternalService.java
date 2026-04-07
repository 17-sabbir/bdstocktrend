package iit.nstu.bdstocktrendbackend.service.external;

public interface ExternalService {


  Object getCompanyInfo(String code);

  Object getDseInfo();

  Object getTopCompaniesByCategory();
}
