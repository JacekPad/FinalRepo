let stringBrandSelect = document.getElementById("stringBrands");
let stringTypeSelect = document.getElementById("stringTypes");
let stringSizeSelect = document.getElementById("stringSizes");
const stringApi = "http://localhost:8080/stringsAPI";

stringBrandSelect.addEventListener("change", event => {
    let brand = stringBrandSelect.value;

    //Remove any previous searches
    while (stringSizeSelect.firstChild) {
        stringSizeSelect.removeChild(stringSizeSelect.firstChild);
    }
    while (stringTypeSelect.firstChild) {
        stringTypeSelect.removeChild(stringTypeSelect.firstChild);
    }

    //Fetch API
    fetch(stringApi).then(resp => {
        return resp.json();
    }).then(obj => {
        for (let i = 0; i < obj.length; i++) {
            if (brand == obj[i].id) {
                //Find String Sizes
                obj[i].sizes.forEach(e => {
                    let sizeOption = document.createElement("option");
                    sizeOption.value = e.id;
                    sizeOption.innerHTML = e.size;
                    stringSizeSelect.appendChild(sizeOption);
                });

                //Find string Types
                obj[i].types.forEach(f => {
                    let typeOption = document.createElement("option");
                    typeOption.value = f.id;
                    typeOption.innerHTML = f.type;
                    stringTypeSelect.appendChild(typeOption);
                });
            }
        }

    });

});