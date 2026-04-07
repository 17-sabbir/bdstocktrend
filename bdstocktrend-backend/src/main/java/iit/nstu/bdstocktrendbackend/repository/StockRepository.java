package iit.nstu.bdstocktrendbackend.repository;

import iit.nstu.bdstocktrendbackend.models.Stock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {

    @Query("SELECT DISTINCT model.code FROM Stock model")
    List<String> getAllUniqueCode();

    @Query("SELECT model " +
            "FROM Stock model " +
            "where model.code = :code " +
            "order by model.date desc " +
            "limit 60")
    List<Stock> getLast30daysByCode(String code);


}
