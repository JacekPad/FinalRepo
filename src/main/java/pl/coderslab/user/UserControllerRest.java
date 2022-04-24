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
    @Autowired
    RoleRepository roleRepository;

    @GetMapping("/userApi")
    public List<User> getUserApi() {
        return userRepository.findAll();
    }

    @GetMapping("/userApi/{id}")
    public User getUserByIdApi(@PathVariable Long id) {
        return userRepository.getById(id);
    }

    @PutMapping(value = "/userAdmin/{id}", consumes = "application/json")
    public void adminUser(@PathVariable Long id, @RequestBody Role role) {
        User user = userRepository.getById(id);
        Set<Role> roles = user.getRoles();
        Role roleToAdd = roleRepository.getById(role.getId());
        roles.add(roleToAdd);
        user.setRoles(roles);
        userRepository.save(user);
    }

    @PutMapping(value = "/userBlock/{id}", consumes = "application/json")
    public void blockUser(@PathVariable Long id, @RequestBody User userApi) {
        System.out.println(id);
        User user = userRepository.getById(id);
        int enabled = userApi.getEnabled();
        System.out.println(enabled);
        user.setEnabled(enabled);
        userRepository.save(user);
    }

}
