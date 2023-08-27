import * as bootstrap from "bootstrap";

document.addEventListener("DOMContentLoaded", function () {
    "use strict";
    const modalEE = new bootstrap.Modal(
        document.getElementById("modalEliminarEmpleado")
    );
    const btnEliminarEmpleado = document.getElementById("eliminarE");

    btnEliminarEmpleado.addEventListener("click", () => {
        modalEE.show();
    })
});
