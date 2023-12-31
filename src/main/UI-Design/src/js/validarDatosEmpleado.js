import * as bootstrap from "bootstrap";
import {
    regExpTelefono,
    regExpNombres,
    regExpApellidos,
    regExpCedula,
    regExpFechaNacimiento,
} from "./regularExpresions";

document.addEventListener("DOMContentLoaded", () => {
    ("use strict");
    // Elementos de Formulario
    const inpCedula = document.querySelector("#cedula");
    const inpNombres = document.querySelector("#nombres");
    const inpApellidos = document.querySelector("#apellidos");
    const inpNacimiento = document.querySelector("#fechaNacimiento");
    const inpTelefono = document.querySelector("#telefono");
    const selectCargo = document.querySelector("#cargo");

    const btnVerificar = document.querySelector("#verficarDatosEmpleado");
    const btnEnviar = document.querySelector("#enviarEmpleado");

    // Etiquetas
    const spanCedula = document.querySelector("#txt-cedula");
    const spanNombres = document.querySelector("#txt-nombres");
    const spanApellidos = document.querySelector("#txt-apellidos");
    const spanNacimiento = document.querySelector("#txt-nacimiento");
    const spanTelefono = document.querySelector("#txt-telefono");
    const spanCargo = document.querySelector("#txt-cargo");

    // Modal y sus elementos
    const modal = new bootstrap.Modal(
        document.getElementById("employRequeriments")
    );
    const titulo = document.getElementById("title-alert");
    const mensaje = document.getElementById("message_");

    // Colores
    let rojo = "#dc3545";

    const camposLlenar = () => {
        titulo.innerHTML = "¡Campos vacíos!";
        titulo.classList.remove("text-success");
        titulo.classList.add("text-danger");
        mensaje.innerHTML =
            "Uno o mas campos están vacíos. Por favor, llena los campos faltantes.";

        if (inpCedula.value === "") {
            inpCedula.style.borderColor = rojo;
            spanCedula.classList.add("text-danger");
        }

        if (inpNombres.value === "") {
            inpNombres.style.borderColor = rojo;
            spanNombres.classList.add("text-danger");
        }

        if (inpApellidos.value === "") {
            inpApellidos.style.borderColor = rojo;
            spanApellidos.classList.add("text-danger");
        }

        if (inpNacimiento.value === "") {
            inpNacimiento.style.borderColor = rojo;
            spanNacimiento.classList.add("text-danger");
        }

        if (inpTelefono.value === "") {
            inpTelefono.style.borderColor = rojo;
            spanTelefono.classList.add("text-danger");
        }

        if (selectCargo.value === "0") {
            selectCargo.style.borderColor = rojo;
            spanCargo.classList.add("text-danger");
        }
    };

    const camposValidos = () => {
        if (
            !regExpCedula.test(inpCedula.value) ||
            !regExpNombres.test(inpNombres.value) ||
            !regExpApellidos.test(inpApellidos.value) ||
            !regExpTelefono.test(inpTelefono.value) ||
            !regExpFechaNacimiento.test(inpNacimiento.value)
        ) {
            if (!regExpCedula.test(inpCedula.value)) {
                inpCedula.style.borderColor = rojo;
                spanCedula.classList.add("text-danger");
            }

            if (!regExpNombres.test(inpNombres.value)) {
                inpNombres.style.borderColor = rojo;
                spanNombres.classList.add("text-danger");
            }

            if (!regExpApellidos.test(inpApellidos.value)) {
                inpApellidos.style.borderColor = rojo;
                spanApellidos.classList.add("text-danger");
            }

            if (!regExpTelefono.test(inpTelefono.value)) {
                inpTelefono.style.borderColor = rojo;
                spanTelefono.classList.add("text-danger");
            }

            if (!regExpFechaNacimiento.test(inpNacimiento.value)) {
                inpNacimiento.style.borderColor = rojo;
                spanNacimiento.classList.add("text-danger");
            }

            titulo.innerHTML = "¡Datos inválidos!";
            titulo.classList.remove("text-success");
            titulo.classList.add("text-danger");
            mensaje.innerHTML =
                "Uno o varios campos tienen datos inválidos. Por favor, corrige y verifica que los datos sean correctos.";
        } else {
            btnEnviar.classList.remove("btn-secondary");
            btnEnviar.classList.add("btn-success");
            btnEnviar.disabled = false;

            titulo.innerHTML = "¡Verificación correcta!";
            titulo.classList.remove("text-danger");
            titulo.classList.add("text-success");
            mensaje.innerHTML = "Los datos son correctos, puede continuar.";
        }
    };

    // Escuchadores de evento
    btnVerificar.addEventListener("click", function () {
        if (
            inpCedula.value === "" ||
            inpNombres.value === "" ||
            inpApellidos.value === "" ||
            inpNacimiento.value === "" ||
            inpTelefono.value === "" ||
            selectCargo.value === "0"
        ) {
            camposLlenar();
        } else {
            camposValidos();
        }
        modal.show();
    });

    const bloquerBotonEnvio = () => {
        btnEnviar.classList.remove("btn-success");
        btnEnviar.classList.add("btn-secondary");
        btnEnviar.disabled = true;
    };

    inpCedula.addEventListener("focus", function () {
        inpCedula.style.borderColor = "";
        spanCedula.classList.remove("text-danger");
        bloquerBotonEnvio();
    });

    inpNombres.addEventListener("focus", function () {
        inpNombres.style.borderColor = "";
        spanNombres.classList.remove("text-danger");
        bloquerBotonEnvio();
    });

    inpApellidos.addEventListener("focus", function () {
        inpApellidos.style.borderColor = "";
        spanApellidos.classList.remove("text-danger");
        bloquerBotonEnvio();
    });

    inpNacimiento.addEventListener("focus", function () {
        inpNacimiento.style.borderColor = "";
        spanNacimiento.classList.remove("text-danger");
        bloquerBotonEnvio();
    });

    inpTelefono.addEventListener("focus", function () {
        inpTelefono.style.borderColor = "";
        spanTelefono.classList.remove("text-danger");
        bloquerBotonEnvio();
    });

    selectCargo.addEventListener("focus", function () {
        selectCargo.style.borderColor = "";
        spanCargo.classList.remove("text-danger");
        bloquerBotonEnvio();
    });

    inpNacimiento.addEventListener("focus", function () {
        inpNacimiento.style.borderColor = "";
        spanNacimiento.classList.remove("text-danger");
        bloquerBotonEnvio();
    });
});
