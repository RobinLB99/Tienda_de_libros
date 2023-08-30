import { Modal } from "bootstrap";

document.addEventListener("DOMContentLoaded", () => {
    ("use strict");
    const url_string = window.location.href;
    const url = new URL(url_string);

    let accionRealizada = url.searchParams.get("accion");
    let errorCargaEmpleado = url.searchParams.get("error");

    if (accionRealizada) {
        switch (accionRealizada) {
            case "unidades_agregadas":
                new Modal(
                    document.getElementById("unidadesAgregadasCorrecto")
                ).show();
                break;

            case "libro_modificado":
                new Modal(
                    document.getElementById("libroModificadoExito")
                ).show();
                break;

            case "libro_eliminado":
                new Modal(
                    document.getElementById("libroEliminadoExito")
                ).show();
                break;

            case "nuevo_libro_ingresado":
                new Modal(
                    document.getElementById("nuevoLibroCorrecto")
                ).show();
                break;

            case "empleado_ingresado":
                new Modal(
                    document.getElementById("empleadoIngresado")
                ).show();
                break;
            
            case "empleado_modificado":
                new Modal(
                    document.getElementById("ModalEmpleadoModificado")
                ).show();
                break;

            case "error":
                new Modal(
                    document.getElementById("errorPeticion")
                ).show();
                break;

            default:
                break;
        }
    }

    if (errorCargaEmpleado === "true") {
        new bootstrap.Modal(
            document.getElementById("errorCargaEmpleado")
        ).show();
    }
});
