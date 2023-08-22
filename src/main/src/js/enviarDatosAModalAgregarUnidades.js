import * as bootstrap from "bootstrap";
document.addEventListener("DOMContentLoaded", () => {
    const idLibro = document.getElementById("idLibro");
    const inputMasUnidades = document.getElementById("unidades-agregar");
    const inputUnidadesAgregar = document.getElementById("f-unidadesAgregar");
    const btn_agregarUnidades = document.getElementById("btn-agregar-unidades");
    const m_idLibro = document.getElementById("f-idLibro");
    const textUnidadesAgregarModal = document.getElementById("t-masUnidades");
    // const boton_enviarModal = document.getElementById("btn_enviarDatosModal")

    btn_agregarUnidades.addEventListener("click", () => {
        if (parseInt(inputMasUnidades.value) <= 0) {
            alert(
                "El numero de unidades a agregar no puedes ser menor o igual a cero!"
            );
            inputMasUnidades.value = "1";
        } else if (parseInt(inputMasUnidades.value) > 50) {
            alert(
                "El numero de unidades a agregar no puedes ser mayor a cincuenta!"
            );
            inputMasUnidades.value = "1";
        } else {
            new bootstrap.Modal(
                document.getElementById("modalUnidades")
            ).show();

            inputUnidadesAgregar.value = inputMasUnidades.value;
            m_idLibro.value = idLibro.value;
            textUnidadesAgregarModal.innerHTML =
                inputMasUnidades.value + " unidades";
        }
    });

    // btn_agregarUnidades.addEventListener("click", () => {
    //     inputUnidadesAgregar.value = inputMasUnidades.value;
    //     m_idLibro.value = idLibro.value;
    //     textUnidadesAgregarModal.innerHTML =
    //         inputMasUnidades.value + " unidades";
    // });

    // boton_enviarModal.addEventListener("click", () => {
    //     console.log("EL numero de unidades a agregar son:" + inputUnidadesAgregar.value)
    //     console.log("EL id del libro es: " + m_idLibro.value)
    // })
});
