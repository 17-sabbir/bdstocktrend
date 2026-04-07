package iit.nstu.bdstocktrendbackend.service.remote;

import iit.nstu.bdstocktrendbackend.config.Constants;
import iit.nstu.bdstocktrendbackend.dto.response.PredictionResponse;
import iit.nstu.bdstocktrendbackend.models.Prediction;
import iit.nstu.bdstocktrendbackend.repository.CompanyRepository;
import iit.nstu.bdstocktrendbackend.repository.PredictionRepository;
import iit.nstu.bdstocktrendbackend.repository.StockRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class RemoteServiceImpl implements RemoteService{

    private final RestTemplate restTemplate;
    private final StockRepository stockRepository;
    private final PredictionRepository predictionRepository;
    private final CompanyRepository companyRepository;

    public void syncAndTraining() {
        ResponseEntity<String> response =
                restTemplate.getForEntity(Constants.ENGINE_URL+"/sync", String.class);

        if(response.getStatusCode().equals(HttpStatus.OK)){

            //List<String> codes = stockRepository.getAllUniqueCode();
            List<String> codes = companyRepository.getAllUniqueCode();
            List<Prediction> predictions = new ArrayList<>();

            for (String code : codes) {

                ResponseEntity<PredictionResponse> predictionResponse = null;

                // retry if there are any exceptions
                while (predictionResponse==null){
                    try {
                        predictionResponse =
                                restTemplate.getForEntity(Constants.ENGINE_URL+"/predict/{code}", PredictionResponse.class, code);
                    } catch (Exception e){
                        log.error(e.getMessage());
                    }
                }

                if (predictionResponse.getStatusCode().equals(HttpStatus.OK)) {
                    PredictionResponse body = predictionResponse.getBody();
                    if(body==null) {
                        throw new RuntimeException("No prediction data for code: " + code);
                    }
                    predictions.addAll(body.getPredictions());
                } else {
                    throw new RuntimeException("Prediction process failed for code: " + code);
                }
            }

            predictionRepository.saveAll(predictions);

        } else {
            throw new RuntimeException("Unable to sync data, aborting prediction stage");
        }
    }

}
