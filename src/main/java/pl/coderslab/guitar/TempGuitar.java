package pl.coderslab.guitar;

import lombok.Data;
import pl.coderslab.guitarStrings.StringBrand;
import pl.coderslab.guitarStrings.StringSize;
import pl.coderslab.guitarStrings.StringType;

import javax.validation.constraints.NotEmpty;

@Data
public class TempGuitar {

    @NotEmpty
    private String guitarName;
    @NotEmpty
    private String guitarType;
    private Integer guitarMaintenanceFreq;
    private StringBrand guitarStringsBrand;
    private StringType guitarStringsType;
    private StringSize guitarStringsSize;
    private Integer guitarStringFreq;
}
