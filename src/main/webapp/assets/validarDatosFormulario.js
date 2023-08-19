(function () {
    "use strict";
    const btnEnviar = document.getElementById("btn-modificarLibro");
    const validarDatos = document.getElementById("validarDatos");
    const tituloAlerta = document.querySelector("#title-alert");
    const mensaje = document.querySelector("#message_");

    let inpCode = document.getElementById("i_code");
    let inpName = document.getElementById("i_nombre");
    let inpAutor = document.getElementById("i_autor");
    let inpYear = document.getElementById("i_anio");
    let inpPrice = document.getElementById("i_precio");
    let inpUnits = document.getElementById("i_unidades");

    const enableSendingButton = () => {
        inpCode = document.getElementById("i_code");
        inpName = document.getElementById("i_nombre");
        inpAutor = document.getElementById("i_autor");
        inpYear = document.getElementById("i_anio");
        inpPrice = document.getElementById("i_precio");
        inpUnits = document.getElementById("i_unidades");

        // Expresiones regulares
        const regExpCode = /^\d{10}$/.test(inpCode.value);
        const regExpName = /\b\w+\s(?:de\s)?\w+\s(?:\w+\s)?\w+\b/.test(
            inpName.value
        );
        const regExpAutor =
            /\b[A-Za-zÀ-ÿ.'-]+\s(?:[A-Za-zÀ-ÿ.'-]+\s[A-Za-zÀ-ÿ.'-]+)?\b/.test(
                inpAutor.value
            );
        const regExpYear = /^\d{4}$/.test(inpYear.value);
        const regExpPrice = /^\d+(.\d{1,2})?$/.test(inpPrice.value);
        const regExpUnits = /\b([1-9]|[1-9][0-9]|100)\b/.test(inpUnits.value);

        let datosVacios =
            inpCode.value === "" ||
            inpName.value === "" ||
            inpAutor.value === "" ||
            inpYear.value === "" ||
            inpPrice.value === "" ||
            inpUnits.value === "";

        switch (
            regExpCode &&
            regExpName &&
            regExpAutor &&
            regExpYear &&
            regExpPrice &&
            regExpPrice &&
            regExpUnits
        ) {
            case true:
                btnEnviar.disabled = false;
                btnEnviar.classList.remove("btn-secondary");
                btnEnviar.classList.add("btn-success");

                tituloAlerta.classList.remove("text-danger");
                tituloAlerta.classList.add("text-success");
                tituloAlerta.innerHTML = "¡Validación exitosa!";
                mensaje.innerHTML =
                    "Los datos parecen ser correctos. Puede continuar con la modificación.";
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
    };

    validarDatos.addEventListener("click", enableSendingButton);

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
})();
