package pl.coderslab.guitar;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
public class Guitar {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String type;

    @ManyToOne
    private GuitarStrings strings;
    private String stringSize;

    private LocalDate stringChange;
    private LocalDate maintenanceDate;
}
