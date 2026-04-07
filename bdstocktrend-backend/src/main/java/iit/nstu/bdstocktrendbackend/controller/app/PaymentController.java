package iit.nstu.bdstocktrendbackend.controller.app;

import static iit.nstu.bdstocktrendbackend.config.Constants.BASE_URL;
import static iit.nstu.bdstocktrendbackend.config.Constants.FRONT_END_CLIENT;

import iit.nstu.bdstocktrendbackend.dto.PaymentInfoDto;
import iit.nstu.bdstocktrendbackend.dto.response.PaymentResponse;
import iit.nstu.bdstocktrendbackend.enums.PaymentStatus;
import iit.nstu.bdstocktrendbackend.models.Payment;
import iit.nstu.bdstocktrendbackend.models.User;
import iit.nstu.bdstocktrendbackend.repository.PaymentRepository;
import iit.nstu.bdstocktrendbackend.repository.UserRepository;
import iit.nstu.bdstocktrendbackend.security.JwtUtils;
import iit.nstu.bdstocktrendbackend.service.user.UserDetailImpl;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequiredArgsConstructor
public class PaymentController {

    private final RestTemplate restTemplate;
    private final PaymentRepository paymentRepository;
    private final JwtUtils jwtUtils;
    private final UserRepository userRepository;

    // SSLCommerz configuration injected from application.properties
    @org.springframework.beans.factory.annotation.Value("${sslcommerz.store.id}")
    private String sslStoreId;

    @org.springframework.beans.factory.annotation.Value("${sslcommerz.store.password}")
    private String sslStorePassword;

    @org.springframework.beans.factory.annotation.Value("${sslcommerz.api.url}")
    private String sslApiUrl;

    @PostMapping(value = "/payment/proceed")
    public ResponseEntity<PaymentResponse> payment(@RequestBody PaymentInfoDto paymentInfoDto) {
        // Set the headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        UUID transactionId = UUID.randomUUID();

        Double amount = 100.00 * paymentInfoDto.getSubscriptionMonths();

        // Create the request body - using injected production credentials
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("store_id", sslStoreId);
        body.add("store_passwd", sslStorePassword);
        body.add("total_amount", amount.toString());
        body.add("currency", "BDT");
        body.add("tran_id", transactionId.toString());
        body.add("success_url", BASE_URL+"/payment/success");
        body.add("fail_url", BASE_URL+"/payment/cancel");
        body.add("cancel_url", BASE_URL+"/payment/fail");
        body.add("cus_name", paymentInfoDto.getCustomerName());
        body.add("cus_email", paymentInfoDto.getCustomerEmail());
        body.add("cus_add1", paymentInfoDto.getCustomerCurrentAddress());
        body.add("cus_add2", paymentInfoDto.getCustomerPermanentAddress());
        body.add("cus_city", paymentInfoDto.getCity());
        body.add("cus_state", paymentInfoDto.getState());
        body.add("cus_postcode", paymentInfoDto.getPostCode());
        body.add("cus_country", paymentInfoDto.getCountry());
        body.add("cus_phone", paymentInfoDto.getPhone());
        body.add("cus_fax", paymentInfoDto.getPhone());
        body.add("multi_card_name", "mastercard,visacard,amexcard,bkash,nagad,rocket,upay");
        body.add("shipping_method", "NO");
        body.add("product_name", "BD Stock Trend Premium Subscription");
        body.add("product_category", "Subscription");
        body.add("product_profile", "non-physical-goods");

        // Build the HttpEntity object with headers and body
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);

        // Use production SSLCommerz API URL from configuration

        LocalDate expiryDate = LocalDate.now().plusMonths(paymentInfoDto.getSubscriptionMonths());

        Payment payment = new Payment();
        payment.setUserId(getCurrentUserId());
        payment.setPaymentDate(LocalDate.now());
        payment.setTrxId(transactionId);
        payment.setExpiryDate(expiryDate);
        payment.setStatusId(PaymentStatus.INITIATED.getId());

        paymentRepository.save(payment);

        // Make the POST request to SSLCommerz production API
        ResponseEntity<PaymentResponse> response = restTemplate.exchange(sslApiUrl, HttpMethod.POST, requestEntity, PaymentResponse.class);

        // Print the response
        System.out.println(response.getBody());

        return new ResponseEntity<>(response.getBody(),HttpStatus.OK);
    }

    @PostMapping(value = "/payment/success", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public RedirectView paymentSuccess(@RequestParam Map<String, String> formData) {
        System.out.println(formData);

        String transactionId = formData.get("tran_id");
        String status = formData.get("status");

        if(status.equals("VALID")){
            Payment payment = paymentRepository.findByTrxId(UUID.fromString(transactionId));
            payment.setStatusId(PaymentStatus.SUCCESSFUL.getId());
            paymentRepository.save(payment);
        }

        RedirectView redirectView = new RedirectView();
        redirectView.setUrl(FRONT_END_CLIENT+"/home");
        return redirectView;
    }

    @PostMapping(value = "/payment/cancel", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public RedirectView paymentCancel(@RequestParam Map<String, String> formData){
        System.out.println(formData);

        RedirectView redirectView = new RedirectView();
        redirectView.setUrl(FRONT_END_CLIENT+"/home");
        return redirectView;

    }

    @PostMapping(value = "/payment/fail", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public void paymentFail(@RequestParam Map<String, String> formData){
        System.out.println(formData);

    }


    @PostMapping(value = "/payment/listener/ipn", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public void paymentIPN(@RequestParam Map<String, String> formData) {
        System.out.println(formData);

        String transactionId = formData.get("tran_id");
        String status = formData.get("status");
        String value_a = formData.get("value_a");
        LocalDate expiryDate = LocalDate.now()
            .plusMonths(Integer.parseInt(value_a));

        String username = jwtUtils.getUserNameFromJwtToken(formData.get("value_b"));

        User user = userRepository.findByUsername(username).orElseThrow(
            ()-> new RuntimeException("Unable to find user"));


        if(status.equals("VALID")){
            Payment payment = new Payment();
            payment.setUserId(user.getId());
            payment.setPaymentDate(LocalDate.now());
            payment.setTrxId(UUID.fromString(transactionId));
            payment.setExpiryDate(expiryDate);
            payment.setStatusId(PaymentStatus.SUCCESSFUL.getId());
            paymentRepository.save(payment);
        }


        //return new ResponseEntity<>(HttpStatus.OK);
    }



    public Long getCurrentUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetailImpl userDetails =(UserDetailImpl) authentication.getPrincipal(); // Your custom UserDetails class
        return userDetails.getId(); // Fetch the user ID from your custom class
    }






}
