package iit.nstu.bdstocktrendbackend.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.UUID;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "payment")
public class Payment {

  @Id
  @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "payment_seq")
  @SequenceGenerator(name = "payment_seq", sequenceName = "payment_seq", allocationSize = 1)
  private Long id;

  private Long userId;

  private LocalDate paymentDate;

  private LocalDate expiryDate;

  private UUID trxId;

  private Long statusId; // 0 -> success
}
