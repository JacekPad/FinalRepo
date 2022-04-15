package pl.coderslab.guitar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.guitarStrings.BrandRepository;
import pl.coderslab.guitarStrings.SizeRepository;
import pl.coderslab.guitarStrings.TypeRepository;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user/guitars/")
public class GuitarController {
    private final GuitarRepository guitarRepository;
    private final BrandRepository brandRepository;
    private final TypeRepository typeRepository;
    private final SizeRepository sizeRepository;

    public GuitarController(GuitarRepository guitarRepository, BrandRepository brandRepository, TypeRepository typeRepository, SizeRepository sizeRepository) {

        this.guitarRepository = guitarRepository;
        this.brandRepository = brandRepository;
        this.typeRepository = typeRepository;
        this.sizeRepository = sizeRepository;
    }

    @RequestMapping("/list")
    public String guitarList(Model model) {
        model.addAttribute("guitars", guitarRepository.findAll());
//        model.addAttribute("strings", guitarRepository.findAll());
        return "/guitar/main";
    }

    @GetMapping("/add")
    public String addGuitarForm(Model model) {
        model.addAttribute("tempGuitar", new TempGuitar());
        model.addAttribute("types", typeRepository.findAll());
        model.addAttribute("brands", brandRepository.findAll());
        model.addAttribute("sizes", sizeRepository.findAll());
        model.addAttribute("maintenanceMonths", maintenanceMonths());
        model.addAttribute("stringChangeMonths", stringChangeMonths());
        return "/guitar/add";
    }

    @PostMapping("/add")
//    validacja potem
    public String addGuitarPost(@Valid TempGuitar tempGuitar, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("types", typeRepository.findAll());
            model.addAttribute("brands", brandRepository.findAll());
            model.addAttribute("sizes", sizeRepository.findAll());
            model.addAttribute("maintenanceMonths", maintenanceMonths());
            model.addAttribute("stringChangeMonths", stringChangeMonths());
            return "/guitar/add";
        }
        LocalDate maintenanceDate = LocalDate.now().plusMonths(tempGuitar.getGuitarMaintenanceFreq());
        LocalDate stringChangeDate = LocalDate.now().plusMonths(tempGuitar.getGuitarStringFreq());

        Guitar guitar = new Guitar();
        guitar.setName(tempGuitar.getGuitarName());
        guitar.setType(tempGuitar.getGuitarType());
        guitar.setMaintenanceFreq(tempGuitar.getGuitarMaintenanceFreq());
        guitar.setStringFreq(tempGuitar.getGuitarStringFreq());
        guitar.setMaintenanceDate(maintenanceDate);
        guitar.setStringChange(stringChangeDate);
        guitar.setStringBrand(tempGuitar.getGuitarStringsBrand());
        guitar.setStringType(tempGuitar.getGuitarStringsType());
        guitar.setStringSize(tempGuitar.getGuitarStringsSize());
        guitarRepository.save(guitar);
        return "redirect:/user/guitars/list";
    }

    @RequestMapping("/delete/{id}")
    public String guitarList(@PathVariable Long id) {
        guitarRepository.delete(guitarRepository.getById(id));
        return "redirect:/user/guitars/list";
    }
                    //FIX THIS
    @GetMapping("/update/{id}")
    public String updateGuitarForm(Model model, @PathVariable Long id) {
        Guitar guitarToUpdate = guitarRepository.getById(id);
//        Dummy dummy = new Dummy();
//        dummy.setGuitar(guitarToUpdate);
//        dummy.setGuitarStrings(guitarToUpdate.getStrings());
//        model.addAttribute("dummy", dummy);
//        model.addAttribute("types", typeRepository.findAll());
//        model.addAttribute("brands", brandRepository.findAll());
//        model.addAttribute("sizes", sizeRepository.findAll());
//        model.addAttribute("maintenanceMonths", maintenanceMonths());
//        model.addAttribute("stringChangeMonths", stringChangeMonths());

        return "/guitar/update";
    }


    //FIX THIS
    @PostMapping("/update")
//    validacja
    public String updateGuitarPost(TempGuitar tempGuitar) {

//        LocalDate maintenanceDate = LocalDate.now().plusMonths(dumy.getGuitar().getMaintenanceFreq());
//        LocalDate stringChangeDate = LocalDate.now().plusMonths(dumy.getGuitar().getStringFreq());
//        dumy.getGuitar().setMaintenanceDate(maintenanceDate);
//        dumy.getGuitar().setStringChange(stringChangeDate);
//        guitarRepository.save(dumy.getGuitar());
        return "redirect:/user/guitars/list";
    }


    public List<Integer> maintenanceMonths() {
        return Arrays.asList(6, 12, 18, 24, 30, 36);
    }

    public List<Integer> stringChangeMonths() {
        return Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
    }


}
