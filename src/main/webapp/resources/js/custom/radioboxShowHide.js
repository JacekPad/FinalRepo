let radioBoxAPI = document.getElementById("uploadChoice1");
let radioBoxUpload = document.getElementById("uploadChoice2");
let aPIDiv = document.getElementById("apiDiv");
let uploadDiv = document.getElementById("uploadDiv");
let button = document.getElementById("shit");

radioBoxAPI.addEventListener("change", function (e) {
    aPIDiv.classList.remove("hidden")
    uploadDiv.classList.add("hidden")
})

radioBoxUpload.addEventListener("change", function (e) {
    aPIDiv.classList.add("hidden")
    uploadDiv.classList.remove("hidden")
})