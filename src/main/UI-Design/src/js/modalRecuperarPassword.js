import { Modal } from "bootstrap";
import { regExpNewPassword } from "./regularExpresions";

document.addEventListener("DOMContentLoaded", () => {
    "use strict";

    const password = document.getElementById("password");
    const repeatPassword = document.getElementById("repeat_password");

    const spanPassword = document.getElementById("spanPassword");

    const btnCheck = document.getElementById("verificarPassword");
    const btnSendPassword = document.getElementById("btnSendPassword");

    const modal = new Modal(document.getElementById("changePasswordModal"));
    const titleModal = document.getElementById("title-modal");
    const modalMessage = document.getElementById("message_");

    const rojo = "#dc3545";

    const isPasswordsMatch = () => {
        if (repeatPassword.value !== password.value) {
            titleModal.classList.add("text-danger");
            titleModal.innerText = "¡No coincide las contraseñas!"
            modalMessage.innerText =
                "Las contraseñas no coinciden. Por favor, verifique que ambos campos sean iguales.";
            repeatPassword.style.borderColor = rojo;
        } else {
            titleModal.classList.remove("text-danger");
            titleModal.classList.add("text-success");
            titleModal.innerText = "¡Verificación exitosa!"
            modalMessage.innerText =
                "Todo esta en orden. Puede continuar y guardar la nueva contraseña";
            btnSendPassword.disabled = false;
        }
    };

    const isEmpty = () => {
        if (password.value === "" || repeatPassword.value === "") {
            titleModal.innerText = "¡Campos vacíos!";
            titleModal.classList.add("text-danger");
            modalMessage.innerText =
                "Uno o ambos campos están vacíos. Por favor, completa todos los campos.";

            if (password.value === "") {
                password.style.borderColor = rojo;
                spanPassword.classList.add("text-danger");
            }

            if (repeatPassword.value === "") {
                repeatPassword.style.borderColor = rojo;
            }
        } else {
            isValidPassword();
        }
    };

    const isValidPassword = () => {
        if (!regExpNewPassword.test(password.value)) {
            titleModal.innerText = "¡Contraseña invalida!";
            titleModal.classList.add("text-danger");
            modalMessage.innerText =
                "La contraseña no es valida. Recuerde que la contraseña puede tener cualquier carácter excepto espacios.";
            password.style.borderColor = rojo;
            spanPassword.classList.add("text-danger");
        } else {
            isPasswordsMatch();
        }
    };

    btnCheck.addEventListener("click", () => {
        spanPassword.classList.remove("text-danger");
        password.style.borderColor = "";
        repeatPassword.style.borderColor = "";
        isEmpty();
        modal.show();
    });

    password.addEventListener("focus", () => {
        spanPassword.classList.remove("text-danger");
        password.style.borderColor = "";
        btnSendPassword.disabled = true;
    });

    repeatPassword.addEventListener("focus", () => {
        repeatPassword.style.borderColor = "";
        btnSendPassword.disabled = true;
    })
});
