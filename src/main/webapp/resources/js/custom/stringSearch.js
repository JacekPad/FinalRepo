let stringBrandSelect = document.getElementById("stringBrands");
let stringTypeSelect = document.getElementById("stringTypes");
let stringSizeSelect = document.getElementById("stringSizes");
const stringApi = "http://localhost:8080/stringsAPI";
let brand = stringBrandSelect.value;

fetchStrings(brand);


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
    fetchStrings(brand)

});

function fetchStrings(brand) {
    fetch(stringApi).then(resp => {
        return resp.json();
    }).then(obj => {
        for (let i = 0; i < obj.length; i++) {
            if (brand == obj[i].id) {
                //Find String Sizes
                obj[i].sizes.forEach(element => {
                    let sizeOption = document.createElement("option");
                    sizeOption.value = element.id;
                    sizeOption.innerHTML = element.size;
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
}