package pl.coderslab.user;


import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
public class FakeUser {

    @Size(min = 8, max = 50)
    @NotEmpty
    private String username;
    @Email
    @NotEmpty
    private String email;
}
