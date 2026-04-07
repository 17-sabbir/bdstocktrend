package iit.nstu.bdstocktrendbackend.service.vacancy;

import iit.nstu.bdstocktrendbackend.dto.response.vacancy.VacancyDetailResponse;

public interface VacancyDetailService {

    VacancyDetailResponse process(String id);
}
