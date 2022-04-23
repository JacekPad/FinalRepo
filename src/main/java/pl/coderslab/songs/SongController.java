package pl.coderslab.songs;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.user.CurrentUser;
import pl.coderslab.user.User;

import javax.validation.Valid;
import java.io.File;
import java.io.FileNotFoundException;
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
        //      is a file or API
        if (file.isEmpty()) {
            song.setHasFile(false);
        } else {
            try {
                song.setHasFile(true);
//                create folder if not present
                File directory = new File("C:\\uploadTest\\" + currentUser.getUsername());
                if (!directory.exists()) {
                    directory.mkdir();
                }
//                save file to user's folder
                int divider = file.getContentType().indexOf("/");
                String fileType = file.getContentType().substring(divider + 1);

                String songNameNoSpaces = song.getName().replaceAll("\\s", "");
                String songAuthorNoSpaces = song.getAuthor().replaceAll("\\s", "");
                String fileName = songNameNoSpaces + "_" + songAuthorNoSpaces + "." + fileType;

                song.setFileName(fileName);
                String savePath = directory + "\\" + fileName;
                file.transferTo(new File(savePath));
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

    //    move song form active to archived
    @GetMapping("/archive/{id}")
    public String songArchive(@PathVariable Long id) {
        Song songToArchive = songRepository.getById(id);
        songToArchive.setActive("0");
        songRepository.save(songToArchive);
        return "redirect:/user/songs/list";
    }

    //    move song form archived to active
    @GetMapping("/active/{id}")
    public String songActive(@PathVariable Long id) {
        Song songToActivate = songRepository.getById(id);
        songToActivate.setActive("1");
        songRepository.save(songToActivate);
        return "redirect:/user/songs/list";
    }

    @GetMapping("/show_file/{id}")
    public String testPicture(Model model, @PathVariable Long id, @AuthenticationPrincipal CurrentUser currentUser) throws FileNotFoundException {
        User loggedUser = currentUser.getUser();
        Song song = songRepository.getById(id);
        User songUser = song.getUser();
        model.addAttribute("user", songUser);
        model.addAttribute("song", song);
        System.out.println(loggedUser.getId().equals(songUser.getId()));
        System.out.println(loggedUser.getId());
        System.out.println(songUser.getId());

        if(!loggedUser.getId().equals(songUser.getId())) {
            return "/403";
        }

        return "user/showUserFile";
    }


    public List<String> guitarTypes() {
        return Arrays.asList("Acoustic", "Bass", "Classic", "Electric");
    }
}
