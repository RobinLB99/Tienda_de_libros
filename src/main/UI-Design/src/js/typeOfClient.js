document.addEventListener("DOMContentLoaded", () => {
    "uses strict";
    const ratioFinalClient = document.getElementById("type1");
    const ratioDataClient = document.getElementById("type2");
    const btnClientSelect = document.getElementById("selectClientButton");
    const isClienteSelected = document.getElementById("text-clientSelected");
    const inpIdClient = document.getElementById("id_clienteSeleccionado");

    ratioFinalClient.addEventListener("click", () => {
        btnClientSelect.disabled = true;
        isClienteSelected.innerText = "Cliente no seleccionado";
        isClienteSelected.classList.remove("text-primary");
        isClienteSelected.classList.add("text-secondary");
        inpIdClient.value = "";
    });

    ratioDataClient.addEventListener("click", () => {
        btnClientSelect.disabled = false;
    });
});
