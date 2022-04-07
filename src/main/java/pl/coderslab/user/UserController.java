package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {
    UserRepository userRepository;

    UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/add")
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        return "user/add";
    }

    @PostMapping("/add")
    public String processForm(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/user/add";
        }
        userRepository.save(user);
        return "redirect:/user/list";
    }

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
