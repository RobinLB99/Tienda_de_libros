document.addEventListener("DOMContentLoaded", () => {
    "uses strict";
    /** Inputs a setear valor */
    const clientSelected = document.getElementById("id_clienteSeleccionado");
    const newClient = document.getElementById("datos_nuevoCliente");

    /**INPUTS DE DATOS NUEVO CLIENTE */
    const cedula = document.getElementById("nc_cedula");
    const nombres = document.getElementById("nc_nombres");
    const apellidos = document.getElementById("nc_apellidos");
    const telefono = document.getElementById("nc_telefono");
    const direccion = document.getElementById("nc_direccion");

    /**Texto a modificar */
    const textoIndicador = document.getElementById("text-clientSelected");

    /**Botón de acción */
    const aceptarCliente = document.getElementById("aceptarNuevoCliente");

    aceptarCliente.addEventListener("click", () => {
        const nuevoCliente = {
            cedula: `${cedula.value}`,
            nombres: `${nombres.value}`,
            apellidos: `${apellidos.value}`,
            telefono: `${telefono.value}`,
            direccion: `${direccion.value}`
        };

        const stringJSON = JSON.stringify(nuevoCliente);

        newClient.value = stringJSON;
        clientSelected.value = "";

        if (newClient.value !== "" && clientSelected.value === "") {
            textoIndicador.classList.remove("text-secondary");
            textoIndicador.classList.add("text-primary")
            textoIndicador.innerText = "Nuevo cliente preparado"
        }
    });
});
