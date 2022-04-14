package pl.coderslab.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.guitar.*;
import pl.coderslab.guitarStrings.GuitarStrings;

@Controller
public class testControllerDELETE {
    @Autowired
    GuitarRepository guitarRepository;

    @Autowired
    GuitarStringRepository guitarStringRepository;


    @GetMapping("/test")
    public String testmain() {
        return "testDELETE";
    }
//
//    @GetMapping("/guitar")
//    public String guitarMain() {
//        return "main";
//    }

    @GetMapping("/user")
    public String userMain() {
        return "user/users_main";
    }

    @GetMapping("/song")
    public String songsMain() {
        return "main";
    }


    @GetMapping("/guitar")
    public String testGUitar(Model model) {
        model.addAttribute("guitar", new Guitar());
        return "/testGuitar";
    }

    @PostMapping("/guitar")
    @ResponseBody
    public String testGuitar2(Guitar guitar) {
        guitarRepository.save(guitar);
        return "redirect:/user/guitars/list";
    }

    @GetMapping("/strings")
    public String testStrings1(Model model) {
        model.addAttribute("strings", new GuitarStrings());
        return "/testStrings";

    }

    @PostMapping("/strings")
    @ResponseBody
    public String testStrings2(GuitarStrings guitarStrings) {
        guitarStringRepository.save(guitarStrings);
        return "redirect:/user/guitars/list";
    }
}


