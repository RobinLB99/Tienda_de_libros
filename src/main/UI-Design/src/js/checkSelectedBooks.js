import { Modal } from "bootstrap";
("uses strict");

export const verificarListaLibros = (stringJSON) => {
    let isTrue = "";
    /\[\]/.test(stringJSON) ? (isTrue = "true") : (isTrue = "false");
    return isTrue;
};

const errorMessage = (modal, titulo, mensaje) => {
    titulo.classList.remove("text-success");
    titulo.classList.add("text-danger");
    titulo.innerText = "Libros no seleccionados";
    mensaje.innerText = "No se ha seleccionado ningún libro";
    modal.show();
};

const successMessage = (modal, titulo, mensaje) => {
    titulo.classList.remove("text-danger");
    titulo.classList.add("text-success");
    titulo.innerText = "Sin novedades";
    mensaje.innerText = "Todo esta en orden. Puede continuar.";
    modal.show();
};

export const lanzarModal = (typeMessage) => {
    const modal = new Modal(document.getElementById("modalCheckList"));
    const titulo = document.getElementById("title-modal-checkList");
    const mensaje = document.getElementById("text-modal");

    typeMessage === "error"
        ? errorMessage(modal, titulo, mensaje)
        : successMessage(modal, titulo, mensaje);
};

export const enableOrDisableButton = (action) => {
    const enviarLista = document.getElementById("enviarListaLibros");
    action === "enabled"
        ? (enviarLista.disabled = false)
        : (enviarLista.disabled = true);
};
