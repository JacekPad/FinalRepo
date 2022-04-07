package pl.coderslab.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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

    @NotEmpty //+ jakies duza litera + cyfra etc
    private String userName;

    @NotEmpty //+ jakies duza litera + cyfra etc
    private String password;

    @Email
    @NotEmpty
    private String email;

    private LocalDate created;

    @PrePersist
    public void prePersist() {
        created = LocalDate.now();
    }
}
