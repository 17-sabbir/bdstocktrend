package iit.nstu.bdstocktrendbackend.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class DashboardDTO {

    String lastUpdateTime;

    List<TimeSeriesDTO> dseX;
    List<TimeSeriesDTO> ds30;
    List<TimeSeriesDTO> dseS;

    Object dseInfo;

    Object topCompaniesByCategory;
}
