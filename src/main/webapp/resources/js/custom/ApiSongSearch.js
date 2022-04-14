let searchButton = document.getElementById("apiSearch");
let tableBody = document.getElementById("tableBody");
let apiContent = document.getElementById("apiContent");
let uploadButton = document.getElementById("uploadButton");

let songNameForm = document.getElementById("songName")
let songAuthorForm = document.getElementById("songAuthor")
let songUrlForm = document.getElementById("songUrl")


searchButton.addEventListener("click", function (e) {
    e.preventDefault();
    let APIArtist = document.getElementById("apiArtist").value;
    let APIName = document.getElementById("apiName").value;
    let link = "http://www.songsterr.com/a/ra/songs.json?pattern=" + APIArtist + " " + APIName;

    fetch(link).then(resp => {
        return resp.json();
    }).then(obj => {

        while (tableBody.firstChild) {
            tableBody.removeChild(tableBody.firstChild);
        }
        for (let i = 0; i < 10; i++) {
            let title = obj[i].title;
            let artist = obj[i].artist.name;
            let id = obj[i].id

            let tableRow = document.createElement("tr");
            let songTitleRow = document.createElement("td");
            let artistNameRow = document.createElement("td");
            let selectButtonRow = document.createElement("td");
            let buttonDiv = document.createElement("div");
            let button = document.createElement("button");

            //Names
            songTitleRow.innerText = title;
            artistNameRow.innerText = artist;
            button.type = "submit";
            button.innerText = "Select";
            //Classes
            button.dataset.id = id;
            buttonDiv.className = "d-flex flex-row justify-content-md-between";
            button.className = "btn cur-p btn-outline-primary selectSong"

            //Table rows - name/artist
            tableRow.appendChild(songTitleRow);
            tableRow.appendChild(artistNameRow);

            //(Table row - button)
            buttonDiv.appendChild(button);
            selectButtonRow.appendChild(buttonDiv);
            tableRow.appendChild(selectButtonRow);
            tableBody.appendChild(tableRow);
        }

        let selectButtons = document.querySelectorAll(".selectSong");
        selectButtons.forEach(function (e) {
            e.addEventListener("click", function (f) {
                f.preventDefault();
                if (apiContent.firstChild) {
                    apiContent.removeChild(apiContent.firstChild);
                }
                let src = "http://www.songsterr.com/a/wa/song?id=" + this.dataset.id;

                //Form filling
                let selectedRow = this.parentElement.parentElement.parentElement.children;
                songNameForm.value = selectedRow[0].innerHTML;
                songAuthorForm.value = selectedRow[1].innerHTML;
                songUrlForm.value = src;
                //
                let iframe = document.createElement("iframe");
                iframe.width = "100%";
                iframe.height = "100%";
                iframe.src = src;
                apiContent.appendChild(iframe);
            })
        })
    })
})

uploadButton.addEventListener("click", function (e) {
    e.preventDefault()
    let uploadAuthor = document.getElementById("uploadAuthor");
    let uploadName = document.getElementById("uploadName");

    songAuthorForm.value = uploadAuthor.value;
    songNameForm.value = uploadName.value;
    songUrlForm.value = "";
})
