package iit.nstu.bdstocktrendbackend.service.vacancy;


import com.google.gson.Gson;
import iit.nstu.bdstocktrendbackend.dto.response.vacancy.VacancyDetailResponse;
import iit.nstu.bdstocktrendbackend.dto.response.vacancy.VacancyListResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;

@Service
public class VacancyListServiceImpl implements VacancyListService {

    private static final String VACANCY_LIST_API_URL = "http://dev3.dansmultipro.co.id/api/recruitment/positions.json";

    @Override
    public VacancyListResponse process() {
        RestTemplate restTemplate = new RestTemplate();
        String jsonResponse = restTemplate.getForObject(VACANCY_LIST_API_URL, String.class);

        Gson gson = new Gson();
        VacancyDetailResponse[] vacancies = gson.fromJson(jsonResponse, VacancyDetailResponse[].class);

        return VacancyListResponse.builder()
                .list(Arrays.asList(vacancies))
                .build();
    }
}
