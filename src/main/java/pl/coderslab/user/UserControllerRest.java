package pl.coderslab.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RestController
public class UserControllerRest {
    @Autowired
    UserRepository userRepository;

    @GetMapping("/userApi")
    public List<User> getUserApi() {
        return userRepository.findAll();
    }

    @GetMapping("/userApi/{id}")
    public User getUserByIdApi(@PathVariable Long id) {
        return userRepository.getById(id);
    }

    @PutMapping(value = "/userApi/{id}", consumes = "application/json")
    public User saveRole(@PathVariable Long id, @RequestBody Role role) {
        User user = userRepository.getById(id);
        Role userRole = (Role) user.getRoles();
        user.setRoles(new HashSet<>(Arrays.asList(userRole,role)));
        return userRepository.save(user);
    }

}
