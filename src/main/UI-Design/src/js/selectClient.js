document.addEventListener("DOMContentLoaded", () => {
    "uses strict";
    const selectClienteButton = document.getElementById("seleccionarCliente");
    const listClients = document.querySelectorAll(".ratioClient");
    const isClienteSelected = document.getElementById("text-clientSelected");
    const inpIdClient = document.getElementById("id_clienteSeleccionado");
    const gotToFacture = document.getElementById("createFacture");

    selectClienteButton.addEventListener("click", () => {
        gotToFacture.disabled = true;
        for (const casilla of listClients) {
            if (casilla.checked) {
                const valor = casilla.value;
                inpIdClient.value = valor;
                break;
            }
        }

        if (inpIdClient.value !== "") {
            isClienteSelected.innerText = "Cliente seleccionado";
            isClienteSelected.classList.remove("text-secondary");
            isClienteSelected.classList.add("text-primary");
        }
    });

    listClients.forEach((casilla) => {
        casilla.addEventListener("click", () => {
            selectClienteButton.disabled = false;
        });
    });
});
