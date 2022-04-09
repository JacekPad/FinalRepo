package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testControllerDELETE {


    @GetMapping("test")
    public String testmain() {
        return "testDELETE";
    }

    @GetMapping("/guitar")
    public String guitarMain() {
        return "guitar/guitars_main";
    }

    @GetMapping("/user")
    public String userMain() {
        return "user/users_main";
    }

    @GetMapping("/song")
    public String songsMain() {
        return "songs/songs_main";
    }
}
