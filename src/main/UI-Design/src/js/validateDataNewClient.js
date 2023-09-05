import {
    regExpCedula,
    regExpApellidos,
    regExpNombres,
    regExpTelefono,
} from "./regularExpresions";

document.addEventListener("DOMContentLoaded", () => {
    "uses strict";
    /**Input de datos recolectados */
    const newClienteData = document.getElementById("datos_nuevoCliente");

    /**INPUTS DE DATOS NUEVO CLIENTE */
    const cedula = document.getElementById("nc_cedula");
    const nombres = document.getElementById("nc_nombres");
    const apellidos = document.getElementById("nc_apellidos");
    const telefono = document.getElementById("nc_telefono");
    const direccion = document.getElementById("nc_direccion");

    /** BOTONES DE ACCION */
    const validarDatos = document.getElementById("validarNuevoCliente");
    const aceptarCliente = document.getElementById("aceptarNuevoCliente");

    let rojo = "#dc3545";

    const datosNoValidos = () => {
        if (!regExpCedula.test(cedula.value)) cedula.style.borderColor = rojo;
        if (!regExpNombres.test(nombres.value)) nombres.style.borderColor = rojo;
        if (!regExpApellidos.test(apellidos.value))
            apellidos.style.borderColor = rojo;
        if (!regExpTelefono.test(telefono.value)) telefono.style.borderColor = rojo;
    };

    const camposIncompletos = () => {
        if (cedula.value === "") cedula.style.borderColor = rojo;
        if (nombres.value === "") nombres.style.borderColor = rojo;
        if (apellidos.value === "") apellidos.style.borderColor = rojo;
        if (telefono.value === "") telefono.style.borderColor = rojo;
        if (direccion.value === "") direccion.style.borderColor = rojo;
    };

    validarDatos.addEventListener("click", () => {
        if (
            cedula.value === "" ||
            nombres.value === "" ||
            apellidos.value === "" ||
            direccion.value === "" ||
            telefono.value === ""
        ) {
            alert("Uno o varios campos están vacíos");
            camposIncompletos();
        } else {
            if (
                !regExpCedula.test(cedula.value) ||
                !regExpNombres.test(nombres.value) ||
                !regExpApellidos.test(apellidos.value) ||
                !regExpTelefono.test(telefono.value)
            ) {
                alert("Uno o varios datos no cumple con los requisitos.");
                datosNoValidos();
            } else {
                alert("Sin novedades. Puede continuar.");
                aceptarCliente.disabled = false;
            }
        }
    });

    cedula.addEventListener("focus", () => {
        cedula.style.borderColor = "";
        aceptarCliente.disabled = true;
    });

    nombres.addEventListener("focus", () => {
        nombres.style.borderColor = "";
        aceptarCliente.disabled = true;
    });

    apellidos.addEventListener("focus", () => {
        apellidos.style.borderColor = "";
        aceptarCliente.disabled = true;
    });

    telefono.addEventListener("focus", () => {
        telefono.style.borderColor = "";
        aceptarCliente.disabled = true;
    });

    direccion.addEventListener("focus", () => {
        direccion.style.borderColor = "";
        aceptarCliente.disabled = true;
    });
});
