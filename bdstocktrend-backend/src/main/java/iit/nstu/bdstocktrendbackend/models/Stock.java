package iit.nstu.bdstocktrendbackend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "historical_stocks_data")
public class Stock {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "historical_stocks_data_seq")
    @SequenceGenerator(name = "historical_stocks_data_seq", sequenceName = "historical_stocks_data_seq", allocationSize = 100)
    private Long id;

    private String code;

    private LocalDate date;
    private Double open;
    private Double high;
    private Double low;
    private Double close;
    private Double volume;

}
