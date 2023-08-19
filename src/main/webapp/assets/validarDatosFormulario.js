(function () {
    "use strict";
    const btnEnviar = document.getElementById("btn-modificarLibro");
    const validarDatos = document.getElementById("validarDatos");
    const tituloAlerta = document.querySelector("#title-alert");
    const mensaje = document.querySelector("#message_");

    const enableSendingButton = () => {
        const inpCode = document.getElementById("i_code");
        const inpName = document.getElementById("i_nombre");
        const inpAutor = document.getElementById("i_autor");
        const inpYear = document.getElementById("i_anio");
        const inpPrice = document.getElementById("i_precio");
        const inpUnits = document.getElementById("i_unidades");

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
                validarDatos.disabled = true;
                validarDatos.innerHTML = "Datos validos";

                btnEnviar.disabled = false;
                btnEnviar.classList.remove("btn-secondary");
                btnEnviar.classList.add("btn-success");

                tituloAlerta.classList.remove("text-danger");
                tituloAlerta.classList.add("text-success");
                tituloAlerta.innerHTML = "¡Validación exitosa!";
                mensaje.innerHTML =
                    "Los datos parecen ser correctos. Puede continuar con la modificación.";

                inpCode.disabled = true;
                inpName.disabled = true;
                inpAutor.disabled = true;
                inpYear.disabled = true;
                inpPrice.disabled = true;
                inpUnits.disabled = true;
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

    validarDatos.addEventListener("click", () => {
        enableSendingButton();
    });
})();
