package iit.nstu.bdstocktrendbackend.repository;

import iit.nstu.bdstocktrendbackend.models.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CompanyRepository extends JpaRepository<Company, Long> {

    @Query("select model from Company model order by model.code")
    List<Company> findAll();

    @Query("SELECT DISTINCT model.code FROM Company model")
    List<String> getAllUniqueCode();
}
