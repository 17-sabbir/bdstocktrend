package iit.nstu.bdstocktrendbackend.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.ArrayList;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
class Desc{
  public String name;
  public String type;
  public String logo;
  public String gw;
  public String r_flag;
  public String redirectGatewayURL;
}

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
class Gw{
  public String visa;
  public String master;
  public String amex;
  public String othercards;
  public String internetbanking;
  public String mobilebanking;
}

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentResponse{
  public String status;
  public String failedreason;
  public String sessionkey;
  public Gw gw;
  public String redirectGatewayURL;
  public String directPaymentURLBank;
  public String directPaymentURLCard;
  public String directPaymentURL;
  public String redirectGatewayURLFailed;
  @JsonProperty("GatewayPageURL")
  public String gatewayPageURL;
  public String storeBanner;
  public String storeLogo;
  public String store_name;
  public ArrayList<Desc> desc;
  public String is_direct_pay_enable;
}
