document.addEventListener("DOMContentLoaded", () => {
    const btnReceptar = document.querySelectorAll(".ReceptarLibrosBTN");
    const inputEnviar = document.getElementById("ID_FacturaALquiler");

    btnReceptar.forEach(receptar => {
        receptar.addEventListener("click", () => {
            const input = receptar.firstChild.nextElementSibling;
            inputEnviar.value = input.value;
        })
    })
});
