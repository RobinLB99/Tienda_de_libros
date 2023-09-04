import {
    verificarListaLibros,
    lanzarModal,
    enableOrDisableButton,
} from "./checkSelectedBooks";
import { Modal } from "bootstrap";

document.addEventListener("DOMContentLoaded", () => {
    "uses strict";
    const registros = document.querySelectorAll(".RegistroLibro");
    const checkboxes = document.querySelectorAll(".inpCheck");
    const inputsNumber = document.querySelectorAll(".inpNumUnit");

    const JSONString = document.getElementById("arrayObjetos");
    const btnTomarLista = document.getElementById("tomarListaLibros");
    const enviarLista = document.getElementById("enviarListaLibros");

    let array = [];

    const tomarLibrosSeleccionados = () => {
        array = [];
        registros.forEach((registro) => {
            const id = registro.children.item(0).children.item(0);
            const unidades = registro.children.item(7).children.item(0);

            if (id.checked) {
                const object = {
                    id: `${id.value}`,
                    unidades: `${unidades.value}`,
                };
                array.push(object);
            }
        });

        const cadenaJSON = JSON.stringify(array);
        JSONString.value = cadenaJSON;

        const isEmptyArray = verificarListaLibros(cadenaJSON);

        if (isEmptyArray === "true") {
            lanzarModal("error");
        } else {
            lanzarModal("success");
            enviarLista.disabled = false;
        }
    };

    btnTomarLista.addEventListener("click", tomarLibrosSeleccionados);

    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener("focus", () =>
            enableOrDisableButton("disable")
        );
    });

    inputsNumber.forEach((input) => {
        input.addEventListener("focus", () =>
            enableOrDisableButton("disable"));
    });
});
