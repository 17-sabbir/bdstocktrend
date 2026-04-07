package iit.nstu.bdstocktrendbackend.dto.response;

import iit.nstu.bdstocktrendbackend.dto.TimeSeriesDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CompanyDetailsResponse {
    List<TimeSeriesDTO> last30Days;
    List<TimeSeriesDTO> next30Days;

    Object info;
}
