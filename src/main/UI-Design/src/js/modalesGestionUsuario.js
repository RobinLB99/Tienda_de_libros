import * as bootstrap from "bootstrap";
import { regExpNameUser, regExpFistPassword } from "./regularExpresions";

document.addEventListener("DOMContentLoaded", () => {
    "use strict";
    // Botones
    const btnVerificar = document.getElementById("verficarDatosCredenciales");
    const btnCrear = document.getElementById("createCredentials");
    const sendC = document.getElementById("enviarCredenciales");

    // Inputs
    const usuario = document.getElementById("nameUser");
    const password = document.getElementById("password");
    const acceso = document.getElementById("typeAccess");

    // Spans
    const spanUserName = document.getElementById("txt-nameUser");
    const spanPassword = document.getElementById("txt-password");
    const spanAccess = document.getElementById("txt-access");

    // Modales
    const crearCredenciales = new bootstrap.Modal(
        document.getElementById("modalCrearCredenciales")
    );

    // Escuchadores de evento
    btnCrear.addEventListener("click", () => {
        crearCredenciales.show();
        usuario.value = "";
        password.value = "";
        acceso.value = "0";

        usuario.style.borderColor = "";
        spanUserName.classList.remove("text-danger");
        password.style.borderColor = "";
        spanPassword.classList.remove("text-danger");
        acceso.style.borderColor = "";
        spanAccess.classList.remove("text-danger");

        sendC.disabled = true;
        sendC.classList.remove("btn-success");
    });

    usuario.addEventListener("focus", () => {
        usuario.style.borderColor = "";
        spanUserName.classList.remove("text-danger");
        sendC.disabled = true;
        sendC.classList.remove("btn-success");
    });

    password.addEventListener("focus", () => {
        password.style.borderColor = "";
        spanPassword.classList.remove("text-danger");
        sendC.disabled = true;
        sendC.classList.remove("btn-success");
    });

    acceso.addEventListener("focus", () => {
        acceso.style.borderColor = "";
        spanAccess.classList.remove("text-danger");
        sendC.disabled = true;
        sendC.classList.remove("btn-success");
    });

    /**
     * Verificar credenciales
     */
    btnVerificar.addEventListener("click", () => {
        const rojo = "#dc3545";

        if (usuario.value === "" || password.value === "" || acceso.value === "0") {
            alert("Existen campos vacíos.");

            if (usuario.value === "") {
                usuario.style.borderColor = rojo;
                spanUserName.classList.add("text-danger");
            }

            if (password.value === "") {
                password.style.borderColor = rojo;
                spanPassword.classList.add("text-danger");
            }

            if (acceso.value === "0") {
                acceso.style.borderColor = rojo;
                spanAccess.classList.add("text-danger");
            }
        } else {
            console.log(regExpNameUser.test(usuario.value));
            if (
                !regExpNameUser.test(usuario.value) ||
                !regExpFistPassword.test(password.value)
            ) {
                alert(
                    "El usuario y/o contraseña no cumplen con los requisitos establecidos."
                );

                if (!regExpNameUser.test(usuario.value)) {
                    usuario.style.borderColor = rojo;
                    spanUserName.classList.add("text-danger");
                }

                if (!regExpFistPassword.test(password.value)) {
                    password.style.borderColor = rojo;
                    spanPassword.classList.add("text-danger");
                }
            } else {
                alert("Datos validos. Puede continuar.");
                sendC.disabled = false;
                sendC.classList.add("btn-success");
            }
        }
    });
});
