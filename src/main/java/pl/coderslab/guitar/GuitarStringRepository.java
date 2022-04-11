package pl.coderslab.guitar;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GuitarStringRepository extends JpaRepository<GuitarStrings, Long> {

    GuitarStrings findByBrandAndSizeAndType (String brand, String stringSize, String stringType);

    @Query(value = "SELECT distinct brand from guitar_strings", nativeQuery = true)
    List<String> getAllBrands();

    @Query(value = "SELECT distinct size from guitar_strings", nativeQuery = true)
    List<String> getAllSizes();

    @Query(value = "SELECT distinct type from guitar_strings", nativeQuery = true)
    List<String> getAllTypes();

}
