package iit.nstu.bdstocktrendbackend.repository;

import iit.nstu.bdstocktrendbackend.models.Company;
import iit.nstu.bdstocktrendbackend.models.Payment;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PaymentRepository extends JpaRepository<Payment, Long> {

  Payment findByTrxId(UUID trxId);

  @Query("Select model "
         + "from Payment model "
         + "where model.userId=:userId "
         + "and model.statusId=1 "
         + "order by model.expiryDate desc "
         + "limit 1")
  Optional<Payment> findFirstByUserIdOrderByExpiryDateDesc(Long userId);

}
