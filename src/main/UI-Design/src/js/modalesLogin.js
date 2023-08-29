import { Modal } from "bootstrap";

/**
 * Modal de valores de credenciales incorrectos.
 */
const userPasswordIncorrect = () => {
    "use strict";
    const modal = new Modal(document.getElementById("AccessValuesIncorrect"));
    modal.show();
};

/**
 * Modal de Cambio contraseña requerida exitoso.
 */
const passwordRequiredChange = () => {
    "use strict";
    const modal = new Modal(document.getElementById("PasswordRequiredChange"));
    modal.show();
};

document.addEventListener("DOMContentLoaded", function () {
    "use strict";
    const url_string = window.location.href;
    const url = new URL(url_string);
    const param = url.searchParams.get("access");

    switch (param) {
        case "incorrect":
            userPasswordIncorrect();
            break;

        case "password_change":
            passwordRequiredChange();
            break;

        default:
            break;
    }
});
