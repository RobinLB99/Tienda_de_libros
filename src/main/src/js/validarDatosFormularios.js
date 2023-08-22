import {
    regExpCode,
    regExpName,
    regExpAutor,
    regExpYear,
    regExpPrice,
    regExpUnits,
} from "./regularExpresions";

document.addEventListener("DOMContentLoaded", () => {
    ("use strict");
    const btnEnviar = document.getElementById("btn-enviar-datos");
    const validarDatos = document.getElementById("validarDatos");
    const tituloAlerta = document.querySelector("#title-alert");
    const mensaje = document.querySelector("#message_");

    let inpCode, inpName, inpAutor, inpYear, inpPrice, inpUnits;

    const inputs = () => {
        inpCode = document.getElementById("i_code");
        inpName = document.getElementById("i_nombre");
        inpAutor = document.getElementById("i_autor");
        inpYear = document.getElementById("i_anio");
        inpPrice = document.getElementById("i_precio");
        inpUnits = document.getElementById("i_unidades");
    };

    inputs();

    validarDatos.addEventListener("click", () => {
        inputs();

        let datosVacios =
            inpCode.value === "" ||
            inpName.value === "" ||
            inpAutor.value === "" ||
            inpYear.value === "" ||
            inpPrice.value === "" ||
            inpUnits.value === "";

        switch (
            regExpCode.test(inpCode.value) &&
            regExpName.test(inpName.value) &&
            regExpAutor.test(inpAutor.value) &&
            regExpYear.test(inpYear.value) &&
            regExpPrice.test(inpPrice.value) &&
            regExpPrice.test(inpUnits.value) &&
            regExpUnits.test(inpUnits.value)
        ) {
            case true:
                btnEnviar.disabled = false;
                btnEnviar.classList.remove("btn-secondary");
                btnEnviar.classList.add("btn-success");

                tituloAlerta.classList.remove("text-danger");
                tituloAlerta.classList.add("text-success");
                tituloAlerta.innerHTML = "¡Validación exitosa!";
                mensaje.innerHTML =
                    "Los datos parecen ser correctos. Puede continuar con la acción.";
                break;

            default:
                tituloAlerta.classList.add("text-danger");

                if (datosVacios) {
                    tituloAlerta.innerHTML = "¡Campos vacíos!";
                    mensaje.innerHTML =
                        "Existen uno o varios campos vacios. Verifica que esten llenos todos los campos.";
                } else {
                    tituloAlerta.innerHTML = "¡Datos invalidos!";
                    mensaje.innerHTML =
                        "Existen uno o varios campos con datos invalidos. Verifica que esten llenos como corresponde al ejemplo";
                }

                btnEnviar.disabled = true;
                break;
        }
    });

    const disableSendingButton = () => {
        btnEnviar.disabled = true;
        btnEnviar.classList.remove("btn-success");
        btnEnviar.classList.add("btn-secondary");
    };

    inpCode.addEventListener("focus", disableSendingButton);
    inpName.addEventListener("focus", disableSendingButton);
    inpAutor.addEventListener("focus", disableSendingButton);
    inpYear.addEventListener("focus", disableSendingButton);
    inpPrice.addEventListener("focus", disableSendingButton);
    inpUnits.addEventListener("focus", disableSendingButton);
});
