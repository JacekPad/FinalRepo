package pl.coderslab.songs;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.user.CurrentUser;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user/songs/")
public class SongController {
    private final SongRepository songRepository;

    public SongController(SongRepository songRepository) {
        this.songRepository = songRepository;
    }

    @GetMapping("/list")
    public String songList(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        model.addAttribute("songs", songRepository.findAll());
        model.addAttribute("loggedUser", currentUser.getUser());
        return "/songs/main";
    }

    @GetMapping("/add")
    public String songAddForm(Model model) {
        model.addAttribute("song", new Song());
        model.addAttribute("guitarTypes", guitarTypes());
        return "/songs/add";
    }

    @PostMapping("/add")
    public String songAdd(@Valid Song song, BindingResult result, Model model, @RequestParam MultipartFile file, @AuthenticationPrincipal CurrentUser currentUser) {
//        validation error
        if (result.hasErrors()) {
            model.addAttribute("guitarTypes", guitarTypes());
            return "/songs/add";
        }
        //is a file or API?
        if (file.isEmpty()) {
            song.setHasFile(false);
        } else {
            try {
                song.setFileContent(file.getBytes());
                song.setHasFile(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        //        set constants
        song.setUser(currentUser.getUser());
        song.setActive("1");
        songRepository.save(song);
        return "redirect:/user/songs/list";
    }

    @GetMapping("/delete/{id}")
    public String songDelete(@PathVariable Long id) {
        songRepository.delete(songRepository.getById(id));
        return "redirect:/user/songs/list";
    }

    @GetMapping("/archive/{id}")
    public String songArchive(@PathVariable Long id) {
        Song songToArchive = songRepository.getById(id);
        songToArchive.setActive("0");
        songRepository.save(songToArchive);
        return "redirect:/user/songs/list";
    }

    @GetMapping("/active/{id}")
    public String songActive(@PathVariable Long id) {
        Song songToActivate = songRepository.getById(id);
        songToActivate.setActive("1");
        songRepository.save(songToActivate);
        return "redirect:/user/songs/list";
    }

    public List<String> guitarTypes() {
        return Arrays.asList("Acoustic", "Bass", "Classic", "Electric");
    }
}
