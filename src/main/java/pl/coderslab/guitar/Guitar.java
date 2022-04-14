package pl.coderslab.guitar;

import lombok.Data;
import pl.coderslab.user.User;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;

@Entity
@Data
public class Guitar {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    private String name;
    @NotEmpty
    private String type;
    private LocalDate created;

    @ManyToOne
    private GuitarStrings strings;
    @ManyToOne
    private User user;

    private Integer stringFreq;
    private LocalDate stringChange;

    private Integer maintenanceFreq;
    private LocalDate maintenanceDate;
}
