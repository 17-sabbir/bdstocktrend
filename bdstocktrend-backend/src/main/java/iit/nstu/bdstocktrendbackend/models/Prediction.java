package iit.nstu.bdstocktrendbackend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "prediction_data")
public class Prediction {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "prediction_data_seq")
    @SequenceGenerator(name = "prediction_data_seq", sequenceName = "prediction_data_seq", allocationSize = 100)
    private Long id;

    private String code;

    private LocalDate date;
    private Double high;
    private Double low;
    private Double close;

    private LocalDate createdAt = LocalDate.now();
}
