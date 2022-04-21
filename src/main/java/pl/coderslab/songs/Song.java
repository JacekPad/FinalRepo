package pl.coderslab.songs;

import lombok.Data;
import org.springframework.cglib.core.Local;
import pl.coderslab.user.User;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;
import java.util.List;

@Entity
@Data
public class Song {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty
    private String name;
    @NotEmpty
    private String author;
    private String url;
    private String guitarType;
    @ManyToOne
    private User user;
    private LocalDate created;
    private String active;
    private boolean hasFile;
    @Lob
    private byte[] fileContent;
    @PrePersist
    public void created() {
        created = LocalDate.now();
    }


}
