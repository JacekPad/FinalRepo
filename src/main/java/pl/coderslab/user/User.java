package pl.coderslab.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.guitar.Guitar;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;
import java.util.List;

@Entity
@Setter
@Getter
@ToString

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty //+ jakies duza litera + cyfra etc
    private String userName;

    @NotEmpty //+ jakies duza litera + cyfra etc
    private String password;

    @Email
    @NotEmpty
    private String email;

    private LocalDate created;

    @OneToMany
    private List<Guitar> guitars;

    @PrePersist
    public void prePersist() {
        created = LocalDate.now();
    }
}
