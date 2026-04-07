package iit.nstu.bdstocktrendbackend.dto;

import jakarta.persistence.Column;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CompanyDTO {
    private Long id;
    private String code;
    private String sector;
    private String name;

    private String website;
    private String logo;
}
