package iit.nstu.bdstocktrendbackend.dto.response;

import iit.nstu.bdstocktrendbackend.dto.CompanyDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CompanyListResponse {
    private List<CompanyDTO> data;
}
