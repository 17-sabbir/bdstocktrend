package iit.nstu.bdstocktrendbackend.service;

import org.springframework.web.multipart.MultipartFile;

public interface StockService {


    void importLegacyData(MultipartFile file);

}
