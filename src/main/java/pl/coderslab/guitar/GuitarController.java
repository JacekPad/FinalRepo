package pl.coderslab.guitar;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.guitarStrings.BrandRepository;
import pl.coderslab.user.CurrentUser;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user/guitars/")
public class GuitarController {
    private final GuitarRepository guitarRepository;
    private final BrandRepository brandRepository;

    public GuitarController(GuitarRepository guitarRepository, BrandRepository brandRepository) {

        this.guitarRepository = guitarRepository;
        this.brandRepository = brandRepository;
    }

    @RequestMapping("/list")
    public String guitarList(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        model.addAttribute("loggedUser",currentUser.getUser());
        model.addAttribute("guitars", guitarRepository.findAll());
        return "/guitar/main";
    }

    @GetMapping("/add")
    public String addGuitarForm(Model model) {
        model.addAttribute("guitar", new Guitar());
        model.addAttribute("brands", brandRepository.findAll());
        model.addAttribute("maintenanceMonths", maintenanceMonths());
        model.addAttribute("stringChangeMonths", stringChangeMonths());
        model.addAttribute("types",guitarTypes());
        return "/guitar/add";
    }

    @PostMapping("/add")
    public String addGuitarPost(@Valid Guitar guitar, BindingResult result, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        if (result.hasErrors()) {
            model.addAttribute("brands", brandRepository.findAll());
            model.addAttribute("maintenanceMonths", maintenanceMonths());
            model.addAttribute("stringChangeMonths", stringChangeMonths());
            return "/guitar/add";
        }
        LocalDate maintenanceDate = LocalDate.now().plusMonths(guitar.getMaintenanceFreq());
        LocalDate stringChangeDate = LocalDate.now().plusMonths(guitar.getStringFreq());
        guitar.setMaintenanceDate(maintenanceDate);
        guitar.setStringChange(stringChangeDate);
        guitar.setUser(currentUser.getUser());
        guitarRepository.save(guitar);
        return "redirect:/user/guitars/list";
    }

    @RequestMapping("/delete/{id}")
    public String guitarList(@PathVariable Long id) {
        guitarRepository.delete(guitarRepository.getById(id));
        return "redirect:/user/guitars/list";
    }
    @GetMapping("/update/{id}")
    public String updateGuitarForm(Model model, @PathVariable Long id) {
        Guitar guitarToUpdate = guitarRepository.getById(id);
        model.addAttribute("guitar", guitarToUpdate);
        model.addAttribute("brands", brandRepository.findAll());
        model.addAttribute("maintenanceMonths", maintenanceMonths());
        model.addAttribute("stringChangeMonths", stringChangeMonths());
        model.addAttribute("types",guitarTypes());
        return "/guitar/update";
    }

    @PostMapping("/update")
    public String updateGuitarPost(@Valid Guitar guitar, BindingResult result, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        if (result.hasErrors()) {
            model.addAttribute("brands", brandRepository.findAll());
            model.addAttribute("maintenanceMonths", maintenanceMonths());
            model.addAttribute("stringChangeMonths", stringChangeMonths());
            return "/guitar/update";
        }
        LocalDate maintenanceDate = LocalDate.now().plusMonths(guitar.getMaintenanceFreq());
        LocalDate stringChangeDate = LocalDate.now().plusMonths(guitar.getStringFreq());
        guitar.setMaintenanceDate(maintenanceDate);
        guitar.setStringChange(stringChangeDate);
        guitar.setUser(currentUser.getUser());
        guitarRepository.save(guitar);
        return "redirect:/user/guitars/list";
    }

    @GetMapping("/change/{id}")
    public String changeStringsDate(@PathVariable Long id){
        Guitar guitar = guitarRepository.getById(id);
        guitar.setStringChange(LocalDate.now().plusMonths(guitar.getStringFreq()));
        guitarRepository.save(guitar);
        return "redirect:/user/guitars/list";
    }

    @GetMapping("/maintenance/{id}")
    public String changeMaintenanceDate(@PathVariable Long id){
        Guitar guitar = guitarRepository.getById(id);
        guitar.setMaintenanceDate(LocalDate.now().plusMonths(guitar.getMaintenanceFreq()));
        guitarRepository.save(guitar);
        return "redirect:/user/guitars/list";
    }

    public List<Integer> maintenanceMonths() {
        return Arrays.asList(6, 12, 18, 24, 30, 36);
    }

    public List<Integer> stringChangeMonths() {
        return Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
    }

    public List<String> guitarTypes() {
        return Arrays.asList("Acoustic","Classic","Electric","Bass");
    }
}
