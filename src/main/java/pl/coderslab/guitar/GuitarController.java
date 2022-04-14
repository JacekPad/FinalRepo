package pl.coderslab.guitar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user/guitars/")
public class GuitarController {

    @Autowired
    GuitarRepository guitarRepository;
    @Autowired
    GuitarStringRepository guitarStringRepository;

    @RequestMapping("/list")
    public String guitarList(Model model) {
        model.addAttribute("guitars",guitarRepository.findAll());
//        model.addAttribute("strings", guitarRepository.findAll());
        return "/guitar/main";
    }

    @GetMapping("/add")
    public String addGuitarForm(Model model) {
        model.addAttribute("dummy", new Dummy());
        model.addAttribute("types", guitarStringRepository.getAllTypes());
        model.addAttribute("brands", guitarStringRepository.getAllBrands());
        model.addAttribute("sizes", guitarStringRepository.getAllSizes());
        model.addAttribute("maintenanceMonths", maintenanceMonths());
        model.addAttribute("stringChangeMonths", stringChangeMonths());
        return "/guitar/add";
    }

    @PostMapping("/add")
//    validacja potem
    public String addGuitarPost(@Valid Dummy dumy, BindingResult result, Model model) {
        if (result.hasErrors()){
            model.addAttribute("types", guitarStringRepository.getAllTypes());
            model.addAttribute("brands", guitarStringRepository.getAllBrands());
            model.addAttribute("sizes", guitarStringRepository.getAllSizes());
            model.addAttribute("maintenanceMonths", maintenanceMonths());
            model.addAttribute("stringChangeMonths", stringChangeMonths());
            return "/guitar/add";
        }
        dumy.getGuitar().setStrings(findStrings(dumy));
        LocalDate maintenanceDate = LocalDate.now().plusMonths(dumy.getGuitar().getMaintenanceFreq());
        LocalDate stringChangeDate = LocalDate.now().plusMonths(dumy.getGuitar().getStringFreq());
        dumy.getGuitar().setMaintenanceDate(maintenanceDate);
        dumy.getGuitar().setStringChange(stringChangeDate);
        dumy.getGuitar().setCreated(LocalDate.now());
        guitarRepository.save(dumy.getGuitar());
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
        Dummy dummy = new Dummy();
        dummy.setGuitar(guitarToUpdate);
        dummy.setGuitarStrings(guitarToUpdate.getStrings());
        model.addAttribute("dummy", dummy);
        model.addAttribute("types", guitarStringRepository.getAllTypes());
        model.addAttribute("brands", guitarStringRepository.getAllBrands());
        model.addAttribute("sizes", guitarStringRepository.getAllSizes());
        model.addAttribute("maintenanceMonths", maintenanceMonths());
        model.addAttribute("stringChangeMonths", stringChangeMonths());

        return "/guitar/update";
    }

    @PostMapping("/update")
//    validacja potem
    public String updateGuitarPost(Dummy dumy) {

        dumy.getGuitar().setStrings(findStrings(dumy));
        LocalDate maintenanceDate = LocalDate.now().plusMonths(dumy.getGuitar().getMaintenanceFreq());
        LocalDate stringChangeDate = LocalDate.now().plusMonths(dumy.getGuitar().getStringFreq());
        dumy.getGuitar().setMaintenanceDate(maintenanceDate);
        dumy.getGuitar().setStringChange(stringChangeDate);
        guitarRepository.save(dumy.getGuitar());
        return "redirect:/user/guitars/list";
    }


    public List<Integer> maintenanceMonths() {
        return Arrays.asList(6, 12, 18, 24, 30, 36);
    }

    public List<Integer> stringChangeMonths() {
        return Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
    }

    private GuitarStrings findStrings(Dummy dummy) {
        String brand = dummy.getGuitarStrings().getBrand();
        String size = dummy.getGuitarStrings().getSize();
        String type = dummy.getGuitarStrings().getType();
        return guitarStringRepository.findByBrandAndSizeAndType(brand, size, type);
    }

}
