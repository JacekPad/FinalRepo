package pl.coderslab.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.guitar.Guitar;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;


@Entity
@Setter
@Getter
@ToString

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty //+ jakas dlugosc
    private String userName;

    @NotEmpty //+ jakies duza litera + cyfra dlugosc etc
    private String password;

    @Email
    @NotEmpty
    private String email;

    private LocalDate created;

//    @OneToMany
//    private List<Guitar> guitars;

    @PrePersist
    public void prePersist() {
        created = LocalDate.now();
    }
}
