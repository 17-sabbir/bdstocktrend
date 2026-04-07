package iit.nstu.bdstocktrendbackend.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class TimeSeriesDTO {

    private LocalDateTime time;
    private Double value;

}
