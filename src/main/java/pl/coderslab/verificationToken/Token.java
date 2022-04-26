package pl.coderslab.verificationToken;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.user.User;

import javax.persistence.*;

@Setter
@Getter
@Entity
public class Token {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String token;
    @OneToOne
    private User user;
}
