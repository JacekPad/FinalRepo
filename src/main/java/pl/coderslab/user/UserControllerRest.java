package pl.coderslab.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserControllerRest {
    @Autowired
UserRepository userRepository;

    @GetMapping("/userApi")
    public List<User> getUserApi () {
        return userRepository.findAll();
    }

    @GetMapping("/userApi/{id}")
    public User getUserByIdApi (@PathVariable Long id){
        return userRepository.getById(id);
    }
}
