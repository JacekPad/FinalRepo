const searchButton = document.getElementById("apiSearch");
const tableBody = document.getElementById("tableBody");
const apiContent = document.getElementById("apiContent");
const uploadButton = document.getElementById("uploadButton");
const songNameForm = document.getElementById("songName")
const songAuthorForm = document.getElementById("songAuthor")
const songUrlForm = document.getElementById("songUrl")


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
        selectButtons.forEach(function (button) {
            button.addEventListener("click", function (event) {
                event.preventDefault();

                //reset buttons names / colors
                selectButtons.forEach(buttons => {
                    buttons.className = "btn cur-p btn-outline-primary selectSong"
                    buttons.innerHTML = "Select"
                })

                //new button color / name
                this.className = "btn cur-p btn-success";
                this.innerHTML = "Selected";

                let src = "http://www.songsterr.com/a/wa/song?id=" + this.dataset.id;

                //Form filling
                let selectedRow = this.parentElement.parentElement.parentElement.children;
                songNameForm.value = selectedRow[0].innerHTML;
                songAuthorForm.value = selectedRow[1].innerHTML;
                songUrlForm.value = src;

                // //remove old iframe info
                // if (apiContent.firstChild) {
                //     apiContent.removeChild(apiContent.firstChild);
                // }

                // //Access denied
                // let iframe = document.createElement("iframe");
                // iframe.width = "100%";
                // iframe.height = "100%";
                // iframe.src = src;
                // apiContent.appendChild(iframe);
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
