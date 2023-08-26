<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<div class="card shadow-sm card-nuevo-empleado">
    <div class="card-header">Ingresar empleado</div>
    <div class="card-body card-body-nuevo-libro">
        <form
            action="SvCrearEmpleado"
            method="POST"
            class="form-persons d-flex flex-column gap-3 mb-3"
        >
            <label class="container p-0">
                <input
                    type="text"
                    name="cedula_"
                    id="cedula"
                    class="form-control"
                    placeholder="Cedula"
                    required
                />
                <span class="text-secondary" id="txt-cedula"
                    >Ingrese el número de cedula de 10 digitos. Ejm: <strong>09</strong>25478023 o <strong>193</strong>7854523.</span
                >
            </label>
            <label class="container p-0">
                <input
                    type="text"
                    name="nombres_"
                    id="nombres"
                    class="form-control"
                    placeholder="Nombres"
                    required
                />
                <span class="text-secondary" id="txt-nombres"
                    >Ingrése dos nombres. No olvide las mayúsculas.</span
                >
            </label>
            <label class="container p-0">
                <input
                    type="text"
                    name="apellidos_"
                    id="apellidos"
                    class="form-control"
                    placeholder="Apellidos"
                    required
                />
                <span class="text-secondary" id="txt-apellidos"
                    >Ingrese dos apellidos. No olvide las mayúsculas.</span
                >
            </label>
            <label class="container p-0">
                <input
                    type="date"
                    name="fechaNacimiento_"
                    id="fechaNacimiento"
                    class="form-control"
                    required
                />
                <span class="text-secondary" id="txt-nacimiento"
                    >Ingrese la fecha de nacimiento.</span
                >
            </label>
            <label class="container p-0">
                <input
                    type="tel"
                    name="telefono_"
                    id="telefono"
                    class="form-control"
                    placeholder="Telefono"
                    required
                />
                <span class="text-secondary" id="txt-telefono"
                    >Ingrese el número telefónico. 10 digitos. Ejm: <strong>09</strong>54875698.</span
                >
            </label>
            <label class="container p-0">
                <select
                    class="form-select"
                    name="cargo_"
                    id="cargo"
                >
                    <option value="0">
                        ----- Seleccione un cargo -----
                    </option>
                    <option value="cajero">Cajero</option>
                    <option value="perchero">
                        Perchero
                    </option>
                    <option value="admin">
                        Administrador
                    </option>
                </select>
                <span class="text-secondary" id="txt-cargo"
                    >Seleccione un cargo para el
                    empleado.</span
                >
            </label>
            <div class="container-fluid p-0">
                <div class="border opacity-25 mb-3"></div>
                <button
                    class="btn btn-secondary"
                    type="submit"
                    id="enviarEmpleado"
                    disabled
                >
                    Ingresar empleado
                </button>
            </div>
        </form>
        <form
            class="row gap-3 m-0"
            action="SvMenuPrincipal"
            method="GET"
        >
            <button
                class="col btn btn-primary"
                type="button"
                id="verficarDatosEmpleado"
            >
                Verificar datos
            </button>
            <button
                class="col btn btn-secondary"
                type="submit"
            >
                Cancelar
            </button>
        </form>
    </div>
</div>

<div
    class="modal fade"
    id="employRequeriments"
    data-bs-backdrop="static"
    data-bs-keyboard="false"
    tabindex="-1"
    aria-labelledby="title-alert"
    aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1
                    class="modal-title fs-5"
                    id="title-alert"
                ></h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                    id="close-modal-1"
                ></button>
            </div>
            <div class="modal-body">
                <span
                    class="m-0 text-secondary"
                    id="message_"
                ></span>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-primary"
                    data-bs-dismiss="modal"
                    id="close-modal-2"
                >
                    Continuar
                </button>
            </div>
        </div>
    </div>
</div>

<div
    class="modal fade"
    id="errorCargaEmpleado"
    data-bs-backdrop="static"
    data-bs-keyboard="false"
    tabindex="-1"
    aria-labelledby="staticBackdropLabel"
    aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1
                    class="modal-title fs-5 text-danger"
                    id="staticBackdropLabel"
                >
                    ¡Error de carga de empleado!
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <span
                    >El empleado no se pudo cargar con
                    éxito. ¡Intente otra vez!</span
                >
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-primary"
                    data-bs-dismiss="modal"
                >
                    Aceptar
                </button>
            </div>
        </div>
    </div>
</div>