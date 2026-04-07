package iit.nstu.bdstocktrendbackend.service;

import iit.nstu.bdstocktrendbackend.models.Stock;
import iit.nstu.bdstocktrendbackend.repository.StockRepository;
import iit.nstu.bdstocktrendbackend.utility.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class StockServiceImpl implements StockService {

    private final StockRepository stockRepository;

    @Override
    public void importLegacyData(MultipartFile file) {
        try {
            List<Stock> stockList = FileHandler.convertCSVToList(file.getInputStream());

            stockRepository.saveAll(stockList);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
