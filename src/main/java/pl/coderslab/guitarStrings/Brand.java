package pl.coderslab.guitarStrings;

import javax.persistence.*;
import java.util.List;

@Entity
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String Brand;

    @OneToMany
    List<Type> types;

    @OneToMany
    List<Size> sizes;

}
