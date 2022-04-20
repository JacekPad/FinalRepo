const blockUserButtons = document.querySelectorAll(".blockUser")
const adminUserButtons = document.querySelectorAll(".adminUser")

adminUserButtons.forEach(button => {
    button.addEventListener("click", event => {
        event.preventDefault()
        let userId = button.dataset.id;
        let apiLink = "http://localhost:8080/userApi/" + userId;

        //object to insert
        let role = {
            id: 2,
            name: "ROLE_ADMIN"
        }

        //put fetch
        return fetch(apiLink,  {
            headers: {'Content-Type': 'application/json' },
            body: JSON.stringify({roles: role}),
            method: 'PUT'
        }).then(resp =>{
            if(!resp.ok) {
                alert("blad")
            }
            return resp.json();
        })

    })
})

