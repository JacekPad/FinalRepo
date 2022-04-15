package pl.coderslab.guitarStrings;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BrandControllerREST {
    BrandRepository brandRepository;

    BrandControllerREST(BrandRepository brandRepository){
        this.brandRepository = brandRepository;
    }

    @GetMapping("/stringsAPI")
    public List<StringBrand> getStrings(){
        return brandRepository.findAll();
    }
}
