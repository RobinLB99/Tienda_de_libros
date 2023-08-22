"use strict";

import * as bootstrap from "bootstrap";

const url_string = window.location.href;
const url = new URL(url_string);

let accionRealizada = url.searchParams.get("accion");

if (accionRealizada) {
    switch (accionRealizada) {
        case "unidades_agregadas":
            new bootstrap.Modal(
                document.getElementById("unidadesAgregadasCorrecto")
            ).show();
            break;

        case "libro_modificado":
            new bootstrap.Modal(
                document.getElementById("libroModificadoExito")
            ).show();
            break;

        case "libro_eliminado":
            new bootstrap.Modal(
                document.getElementById("libroEliminadoExito")
            ).show();
            break;

        case "error":
            new bootstrap.Modal(
                document.getElementById("errorPeticion")
            ).show();
            break;

        default:
            break;
    }
}
