package pl.coderslab.songs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user/songs/")
public class SongController {

    @Autowired
    SongRepository songRepository;

    @GetMapping("/list")
    public String songList() {
        songRepository.findAll();
        return "/songs/main";
    }

    @GetMapping("/add")
    public String songAdd(Model model) {
        model.addAttribute("song",new Song());
        model.addAttribute("guitarTypes",guitarTypes());
        return "/songs/add";
    }

    public List<String> guitarTypes() {
        return Arrays.asList("Acoustic","Bass","Classic","Electric");
    }
}
