package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {
    UserRepository userRepository;

    UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    @GetMapping("/")
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/")
    public String processForm(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "login";
        }
        userRepository.save(user);
        return "redirect:/";
    }

// if logged in send to song list???
//fix password hash
    @PostMapping("/login")
    @ResponseBody
    public String registerUser(@RequestParam String userName, @RequestParam String password) {
        List<User> allUsers = userRepository.findAll();
        for (User allUser : allUsers) {
            if (allUser.getUserName().equals(userName) && allUser.getPassword().equals(password)) {
                return "You are logged in";
            }
        }
        return "wrong username or password";
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
