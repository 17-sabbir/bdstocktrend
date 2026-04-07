package iit.nstu.bdstocktrendbackend.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class NewsDTO {
    private String title;
    private String description;
    private String date;
}
