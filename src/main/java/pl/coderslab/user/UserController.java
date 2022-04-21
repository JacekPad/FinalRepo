package pl.coderslab.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class UserController {
    private final UserRepository userRepository;
    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;

    UserController(UserRepository userRepository, UserService userService, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/register")
    public String processForm(@Valid User user, BindingResult result, @RequestParam String password2) {
//        DELETE SOUTS
        System.out.println("password usera: " + user.getPassword());
        System.out.println("password 2: " + password2);
        System.out.println("dlugosc: " + user.getPassword().length());
        if (result.hasErrors()) {
            System.out.println("wrong");
            if(!user.getPassword().equals(password2)){
                result.rejectValue("password","error.password","password don't match");
                return "/login";
            }
            return "/login";
        }
        if(!user.getPassword().equals(password2)){
            result.rejectValue("password","error.password","password don't match");
            return "/login";
        }
        System.out.println("git");
        userService.saveUser(user);
        return "/registrationCompleted";
    }

    @GetMapping("/test")
    public String test() {
        return "/registrationCompleted";
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
    public String processUser(@Valid User user, BindingResult result, @AuthenticationPrincipal CurrentUser currentUser, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("user", currentUser.getUser());
            return "/user/profile";
        }
        userService.saveUser(user);
        return "redirect:/user/profile";
    }

    @GetMapping("/user/password_change")
    public String changePassword(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        model.addAttribute("previousPassword", currentUser.getUser().getPassword());
        model.addAttribute("user", currentUser.getUser());
        return "/user/passwordChange";
    }

    @PostMapping("/user/password_change")
    public String changePasswordCheck(@Valid User user, BindingResult result, @RequestParam String previousPassword, @RequestParam String newPassword2, @RequestParam String typedOldPassword, Model model,@AuthenticationPrincipal CurrentUser currentUser) {
//        DELETE SOUTS
        if (result.hasErrors()) {
            System.out.println("error");
            model.addAttribute("previousPassword", currentUser.getUser().getPassword());
            return "/user/passwordChange";
        }
        if(!passwordEncoder.matches(typedOldPassword,previousPassword) || !user.getPassword().equals(newPassword2)){
            result.rejectValue("password","error.password","Wrong old password or new password don't match");
            return "/user/passwordChange";
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return "redirect:/user/profile";
    }
}
