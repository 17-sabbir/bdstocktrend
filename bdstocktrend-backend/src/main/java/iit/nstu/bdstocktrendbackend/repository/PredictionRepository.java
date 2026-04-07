package iit.nstu.bdstocktrendbackend.repository;

import iit.nstu.bdstocktrendbackend.models.Prediction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PredictionRepository extends JpaRepository<Prediction, Long> {

    @Query("SELECT model " +
            "FROM Prediction model " +
            "where model.code = :code " +
            "order by model.date asc " +
            "limit 30")
    List<Prediction> getNext30daysByCode(String code);
}
