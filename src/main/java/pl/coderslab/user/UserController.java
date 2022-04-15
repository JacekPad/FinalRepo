package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class UserController {
    private final UserRepository userRepository;
    private final UserService userService;

    UserController(UserRepository userRepository, UserService userService) {
        this.userRepository = userRepository;
        this.userService = userService;
    }
    @GetMapping("/login")
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/register")
    public String processForm(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "login";
        }
        userService.saveUser(user);
//        userRepository.save(user);
        return "redirect:/login";
    }

    //Random stuff
    @GetMapping("/list")
    public String findAll(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "user/list";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("user", userRepository.getById(id));
        return "user/update";
    }

    @PostMapping("/update")
    public String update(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user/update";
        }
        userRepository.save(user);
        return "redirect:/user/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        userRepository.delete(userRepository.getById(id));
        return "redirect:/user/list";
    }


}
