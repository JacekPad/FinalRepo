package pl.coderslab.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.verificationToken.Token;
import pl.coderslab.verificationToken.TokenRepository;
import pl.coderslab.verificationToken.TokenServiceImpl;

import javax.validation.Valid;

@Controller
public class UserController {
    private final UserRepository userRepository;
    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final TokenServiceImpl tokenServiceImpl;
    private final TokenRepository tokenRepository;

    UserController(UserRepository userRepository, UserService userService, BCryptPasswordEncoder passwordEncoder, TokenServiceImpl tokenServiceImpl, TokenRepository tokenRepository) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.tokenServiceImpl = tokenServiceImpl;
        this.tokenRepository = tokenRepository;
    }

    @GetMapping("/login")
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/register")
    public String processForm(@Valid User user, BindingResult result, @RequestParam String password2, Model model) {
//        validation fail
        if (result.hasErrors()) {
            return "/login";
        }
//        custom validation fail
        if (!user.getPassword().equals(password2)) {
            result.rejectValue("password", "error.passwordMatch", "password don't match");
            return "/login";
        }
        if (user.getPassword().length() < 10 || user.getPassword().length() > 20) {
            result.rejectValue("password", "error.passwordLength", "password has to be between 10 and 20 characters");
            return "/login";
        }
//        create auth token
        Token token = tokenServiceImpl.createToken();
        token.setUser(user);
        user.setEnabled(0);
        userService.saveUser(user);
        model.addAttribute("token", token);
        return "/tokenActivation";
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
        User user = currentUser.getUser();

        FakeUser fakeUser = new FakeUser();
        fakeUser.setUsername(user.getUsername());
        fakeUser.setEmail(user.getEmail());
        model.addAttribute("fakeUser", fakeUser);
        return "/user/profile";
    }

    @PostMapping("/user/profile")
    public String processUser(@Valid FakeUser fakeUser, BindingResult result, @AuthenticationPrincipal CurrentUser currentUser, Model model) {

        if (result.hasErrors()) {
            return "/user/profile";
        }
        User user = currentUser.getUser();
        user.setUsername(fakeUser.getUsername());
        user.setEmail(fakeUser.getEmail());
        userRepository.save(user);
        return "redirect:/user/profile";
    }

    @GetMapping("/user/password_change")
    public String changePassword(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        model.addAttribute("previousPassword", currentUser.getUser().getPassword());
        model.addAttribute("user", currentUser.getUser());
        return "/user/passwordChange";
    }

    @PostMapping("/user/password_change")
    public String changePasswordCheck(@Valid User user, BindingResult result, @RequestParam String previousPassword, @RequestParam String newPassword2, @RequestParam String typedOldPassword, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
//        validation fail
        if (result.hasErrors()) {
            model.addAttribute("previousPassword", currentUser.getUser().getPassword());
            return "/user/passwordChange";
        }
//        custom validation fail
        if (!passwordEncoder.matches(typedOldPassword, previousPassword) || !user.getPassword().equals(newPassword2)) {
            result.rejectValue("password", "error.password", "Wrong old password or new password don't match");
            model.addAttribute("previousPassword", currentUser.getUser().getPassword());
            return "/user/passwordChange";
        }
        if (user.getPassword().length() < 10 || user.getPassword().length() > 20) {
            result.rejectValue("password", "error.passwordLength", "password has to be between 10 and 20 characters");
            model.addAttribute("previousPassword", currentUser.getUser().getPassword());
            return "/user/passwordChange";
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        userRepository.save(user);
        return "redirect:/user/profile";
    }

    @GetMapping("/token-activation/{tokenString}")
    public String activateAccount(@PathVariable String tokenString) {
        Token token = tokenRepository.findByToken(tokenString);
        User user = token.getUser();
        user.setEnabled(1);
        userRepository.save(user);
        return "/registrationCompleted";
    }
}
