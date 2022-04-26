//change userDetails
const usernameButton = document.getElementById("usernameUnlock");
const emailButton = document.getElementById("emailUnlock");
const usernameForm = document.getElementById("username");
const emailForm = document.getElementById("email");
const submitButton = document.getElementById("submitChanges");
const oldUsernameValue = usernameForm.value;
const oldEmailValue = emailForm.value;

usernameButton.addEventListener("click", button => {
    button.preventDefault()
    usernameForm.disabled = false;
});

emailButton.addEventListener("click", button => {
    button.preventDefault()
    emailForm.disabled = false;
});

usernameForm.addEventListener("input", form =>{
    if(usernameForm.value === oldUsernameValue && emailForm.value === oldEmailValue){
        submitButton.disabled = true;
        submitButton.className = "btn cur-p btn-danger"
    } else {
        submitButton.disabled = false;
        submitButton.className = "btn cur-p btn-success"
    }
});

emailForm.addEventListener("input", form =>{
    if(emailForm.value === oldEmailValue && usernameForm.value === oldUsernameValue){
        submitButton.disabled = true;
        submitButton.className = "btn cur-p btn-danger"
    } else {
        submitButton.disabled = false;
        submitButton.className = "btn cur-p btn-success"
    }
})

submitButton.addEventListener("click", button => {
    usernameForm.disabled = false;
    emailForm.disabled = false;
})



