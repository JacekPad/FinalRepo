package pl.coderslab.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
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

    @GetMapping("/admin/user/delete/{id}")
    public String delete(@PathVariable Long id) {
        userRepository.delete(userRepository.getById(id));
        return "redirect:/admin/user/list";
    }

    @GetMapping("/admin/user/list")
    public String getUserList(Model model) {
        model.addAttribute("users", userRepository.findAll());
        return "user/main";
    }

    @GetMapping("/user/profile")
    public String getUserProfile(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        model.addAttribute("user", currentUser.getUser());
        return "/user/profile";
    }

    @PostMapping("/user/profile")
    public String processUser(@Valid User user, BindingResult result,@AuthenticationPrincipal CurrentUser currentUser,Model model) {
        System.out.println("this usernem:" + user.getUsername());
        System.out.println("this email: " + user.getEmail());
        if (result.hasErrors()) {
            model.addAttribute("user", currentUser.getUser());
            System.out.println("wrong");
            return "/user/profile";
        }
        System.out.println("right");
        userService.saveUser(user);
        return "redirect:/user/profile";
    }

}
