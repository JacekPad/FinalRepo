package pl.coderslab.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Email;
import java.time.LocalDate;
import java.util.Set;

@Entity
@Setter
@Getter
@ToString

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
//    @NotEmpty
    @Column(unique = true, length = 50,nullable = false)
    private String username;
//    @NotEmpty
    private String password;
    @Email
//    @NotEmpty
    private String email;
    private LocalDate created;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Role> roles;


    @PrePersist
    public void prePersist() {
        created = LocalDate.now();
    }
}
