package iit.nstu.bdstocktrendbackend.dto.response;

import iit.nstu.bdstocktrendbackend.models.Prediction;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PredictionResponse {
    private List<Prediction> predictions;
}
