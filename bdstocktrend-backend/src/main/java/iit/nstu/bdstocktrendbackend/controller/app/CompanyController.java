package iit.nstu.bdstocktrendbackend.controller.app;

import iit.nstu.bdstocktrendbackend.dto.CompanyDTO;
import iit.nstu.bdstocktrendbackend.dto.response.CompanyDetailsResponse;
import iit.nstu.bdstocktrendbackend.dto.response.CompanyListResponse;
import iit.nstu.bdstocktrendbackend.models.Payment;
import iit.nstu.bdstocktrendbackend.models.Role;
import iit.nstu.bdstocktrendbackend.repository.PaymentRepository;
import iit.nstu.bdstocktrendbackend.service.CompanyService;
import iit.nstu.bdstocktrendbackend.service.external.ExternalService;
import iit.nstu.bdstocktrendbackend.utility.SecurityUtil;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyService companyService;
    private final ExternalService externalService;
    private final PaymentRepository paymentRepository;

    @GetMapping("/api/companies")
    public CompanyListResponse getCompanies(){

        CompanyListResponse companyListResponse = new CompanyListResponse();
        companyListResponse.setData(companyService.getCompanies());

        return companyListResponse;
    }

    @GetMapping("/api/companies/{code}")
    public CompanyDetailsResponse getCompanyDetails(
            @PathVariable String code){

        CompanyDetailsResponse companyDetailsResponse = new CompanyDetailsResponse();

        Optional<Payment> paymentOptional = paymentRepository.findFirstByUserIdOrderByExpiryDateDesc(
            SecurityUtil.getCurrentUserId());

        if (paymentOptional.isPresent() && !paymentOptional.get().getExpiryDate()
            .isBefore(LocalDate.now())) {
            companyDetailsResponse.setLast30Days(companyService.last30daysData(code));
            companyDetailsResponse.setNext30Days(companyService.next30daysData(code));
        } else {
            companyDetailsResponse.setLast30Days(new ArrayList<>());
            companyDetailsResponse.setNext30Days(new ArrayList<>());
        }

        companyDetailsResponse.setInfo(externalService.getCompanyInfo(code));

        return companyDetailsResponse;
    }
}
