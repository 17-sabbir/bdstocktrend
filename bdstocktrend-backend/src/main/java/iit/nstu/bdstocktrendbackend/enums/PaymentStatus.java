package iit.nstu.bdstocktrendbackend.enums;

import lombok.Getter;

@Getter
public enum PaymentStatus {

  INITIATED(0L),
  SUCCESSFUL(1L);

  private Long id;

  PaymentStatus(Long id) {
    this.id = id;
  }
}
