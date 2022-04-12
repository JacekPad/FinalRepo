package pl.coderslab.songs;

import lombok.Data;
import pl.coderslab.user.User;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Data
public class Song {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String author;
    private String url;
    private String fileOrSomething;
    private String guitarType;
    @ManyToMany
//    ManyToMany czy manyToOne?
//    User moze miec pare piosenek, kilka userow moze miec zapisana ta sama piosenke po API?
//    Jak usunac piosenke u 1 usera w ManyToMany tak zeby nie usunelo jej u drugiego usera?
    private List<User> users;
    private LocalDate created;


}
