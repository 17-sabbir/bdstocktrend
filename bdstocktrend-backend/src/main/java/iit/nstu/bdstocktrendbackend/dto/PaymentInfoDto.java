package iit.nstu.bdstocktrendbackend.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentInfoDto {

  private Long subscriptionMonths;

  private String customerName;
  private String customerEmail;
  private String customerCurrentAddress;
  private String customerPermanentAddress;
  private String city;
  private String state;
  private String postCode;
  private String country;
  private String phone;
}
