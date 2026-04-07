package iit.nstu.bdstocktrendbackend.controller.imports;

import iit.nstu.bdstocktrendbackend.service.StockService;
import iit.nstu.bdstocktrendbackend.utility.FileHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequiredArgsConstructor
public class DataImportRestController {

    private final StockService stockService;

    @PostMapping("/api/import-historical-data")
    public ResponseEntity<?> importData(
            @RequestParam MultipartFile file
            ){
        if(FileHandler.checkCSVFormat(file)){
            stockService.importLegacyData(file);
            return ResponseEntity.ok(Map.of("message","successful"));
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("File format not accepted");
    }
}
