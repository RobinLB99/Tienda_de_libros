import { regExpFistPassword } from "./regularExpresions";
import { Modal } from "bootstrap";

document.addEventListener("DOMContentLoaded", () => {
    "uses strict";
    const permisos = document.getElementById("permisos");
    const password = document.getElementById("new-password");

    const spanPassword = document.getElementById("span-password");

    const btnValPermisos = document.getElementById("val-permisos");
    const btnValPassword = document.getElementById("val-password");

    const btnCambiarPermisos = document.getElementById("cambiar-permisos");
    const btnCambiarPassword = document.getElementById("btn-cambiar-password");

    const modalVal = new Modal(
        document.getElementById("modalConfirmValidations")
    );

    const titleModal = document.getElementById("titleModalValidation");
    const messageModal = document.getElementById("messageModal");

    let rojo = "#dc3545";

    /**
     * Validaciones de privilegios de usuario
     */
    const habilitarCambiarPermisos = () => {
        btnCambiarPermisos.disabled = false;
        btnCambiarPermisos.classList.remove("btn-secondary");
        btnCambiarPermisos.classList.add("btn-success");
    };

    const deshabilitarCambiarPermisos = () => {
        btnCambiarPermisos.disabled = true;
        btnCambiarPermisos.classList.remove("btn-success");
        btnCambiarPermisos.classList.add("btn-secondary");
    };

    const avisoPermisoValido = () => {
        titleModal.innerText = "Permiso valido";
        messageModal.innerText = "El permiso es valido. Puede continuar.";
        modalVal.show();
    }

    const avisoPermisoInvalido = () => {
        titleModal.innerText = "Permiso invalido";
        messageModal.innerText = "No se selecciono un permiso para esta credencial de acceso.\nPor favor, seleccione un permiso antes de continuar.";
        modalVal.show();
    }

    const permisoInvalido = () => {
        avisoPermisoInvalido();
        permisos.style.borderColor = rojo;
    };

    const permisoValido = () => {
        avisoPermisoValido();
        habilitarCambiarPermisos();
    };

    btnValPermisos.addEventListener("click", () => {
        permisos.value === "0" && permisoInvalido();
        permisos.value !== "0" && permisoValido();
    });

    permisos.addEventListener("focus", () => {
        deshabilitarCambiarPermisos();
        permisos.style.borderColor = "";
    });

    /**
     * Validaciones de contraseña
     */

    const habilitarCambiarPassword = () => {
        btnCambiarPassword.classList.remove("btn-secondary");
        btnCambiarPassword.classList.add("btn-success");
        btnCambiarPassword.disabled = false;
    };

    const deshabilitarCambiarPassword = () => {
        btnCambiarPassword.classList.remove("btn-success");
        btnCambiarPassword.classList.add("btn-secondary");
        btnCambiarPassword.disabled = true;
    };

    const avisoPasswordValido = () => {
        titleModal.innerText = "Contraseña valida";
        messageModal.innerText = "La contraseña es valida. Puede continuar.";
        modalVal.show();
    }

    const avisoPasswordInvalido = () => {
        titleModal.innerText = "Contraseña invalida";
        messageModal.innerText = "Existen espacios en el campo o esta vació. Por favor, revise y corrija el campo.";
        modalVal.show();
    }

    const passwordValido = () => {
        avisoPasswordValido();
        habilitarCambiarPassword();
    };

    const passwordInvalido = () => {
        avisoPasswordInvalido();
        password.style.borderColor = rojo;
        spanPassword.classList.add("text-danger");
    };

    btnValPassword.addEventListener("click", () => {
        regExpFistPassword.test(password.value) ? passwordValido() : passwordInvalido();
    });

    password.addEventListener("focus", () => {
        deshabilitarCambiarPassword();
        password.style.borderColor = "";
        spanPassword.classList.remove("text-danger");
    });
});
