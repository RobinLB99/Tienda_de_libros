document.addEventListener("DOMContentLoaded", () => {
    const checkFinalC = document.getElementById("type1");
    const checkDataC = document.getElementById("type2");

    const clientSelected = document.getElementById("id_clienteSeleccionado");
    const newClient = document.getElementById("datos_nuevoCliente");

    const btnVerForFacture = document.getElementById("verForFacture");
    const gotToFacture = document.getElementById("createFacture");

    const habilitarEnvio = () => {
        alert("Todo en orden. Puede continuar con la facturación.");
        gotToFacture.disabled = false;
    };

    btnVerForFacture.addEventListener("click", () => {
        if (checkFinalC.checked) {
            habilitarEnvio();
        }

        if (checkDataC.checked) {
            if (clientSelected.value !== "" || newClient.value !== "") {
                habilitarEnvio();
            } else {
                alert("Debe seleccionar un cliente o ingresar uno nuevo para continuar.")
            }
        }
    });

    checkFinalC.addEventListener("focus", () => {
        gotToFacture.disabled = true;
    })

    checkDataC.addEventListener("focus", () => {
        gotToFacture.disabled = true;
    })
});
