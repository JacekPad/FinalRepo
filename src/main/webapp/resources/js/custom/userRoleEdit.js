const blockUserButtons = document.querySelectorAll(".blockUser")
const unlockUserButtons = document.querySelectorAll(".unblockUser")
const adminUserButtons = document.querySelectorAll(".adminUser")
const token = document.getElementById("token").value;

adminUserButtons.forEach(button => {
    button.addEventListener("click", event => {
        event.preventDefault()
        let userId = button.dataset.id;
        let apiLink = "http://localhost:8080/userAdmin/" + userId;

        //put fetch
        fetch(apiLink, {
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest',
                'X-CSRF-Token': token,
            },
            body: JSON.stringify({id: 2, name: "ROLE_ADMIN"}),
            method: 'PUT'
        }).then(resp => {
            if (!resp.ok) {
                alert("error")
            }
        })

    })
})

blockUserButtons.forEach(button => {
    let userId = button.dataset.id;
    let userEnabledTable = document.getElementById("userEnabled" + userId)
    button.addEventListener("click", event => {
        event.preventDefault()
        // let userId = button.dataset.id;
        let apiLink = "http://localhost:8080/userBlock/" + userId;

        //put fetch
        fetch(apiLink, {
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest',
                'X-CSRF-Token': token,
            },
            body: JSON.stringify({enabled: 0}),
            method: 'PUT'
        }).then(resp => {
            if (!resp.ok) {
                alert("error")
            }
        })
        userEnabledTable.innerHTML = "No";
    })
})

unlockUserButtons.forEach(button => {
    button.addEventListener("click", event => {
        event.preventDefault()
        let userId = button.dataset.id;
        let apiLink = "http://localhost:8080/userBlock/" + userId;

        //put fetch
        fetch(apiLink, {
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest',
                'X-CSRF-Token': token,
            },
            body: JSON.stringify({enabled: 1}),
            method: 'PUT'
        }).then(resp => {
            if (!resp.ok) {
                alert("blad")
            }
        })
        let userEnabledTable = document.getElementById("userEnabled" + userId)
        userEnabledTable.innerHTML = "Yes";

    })
})

