package pl.coderslab.guitarStrings;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Setter
@Getter
@ToString
public class StringBrand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String Brand;

    @ManyToMany
    List<StringType> types;

    @ManyToMany
    List<StringSize> sizes;

}
