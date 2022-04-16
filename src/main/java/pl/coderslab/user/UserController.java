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
        return "redirect:/login";
    }

    @GetMapping("admin/user/update/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("user", userRepository.getById(id));
        return "user/update";
    }

    @PostMapping("/admin/update")
    public String update(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user/update";
        }
        userRepository.save(user);
        return "redirect:/user/list";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String delete(@PathVariable Long id) {
        userRepository.delete(userRepository.getById(id));
        return "redirect:/admin/user/list";
    }

    @GetMapping("/admin/user/list")
    public String getUserList(Model model) {
        model.addAttribute("users",userRepository.findAll());
        return "user/main";
    }



}
