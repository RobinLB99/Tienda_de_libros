<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<!-- Nuevo libro -->
<div class="card shadow-sm card-nuevo-libro">
    <div class="card-header">Nuevo libro</div>
    <div class="card-body card-body-nuevo-libro">
        <form
            action="SvNuevoLibro"
            method="POST"
            class="d-flex flex-column gap-3 mb-3 justify-content-center formulario-modificar-libro"
        >
            <div class="d-flex flex-column gap-3">
                <div class="d-flex flex-column">
                    <input
                        class="form-control"
                        type="text"
                        name="codigo_"
                        id="i_code"
                        value=""
                        placeholder="Codigo"
                        required
                    />
                    <div
                        class="text-secondary"
                        style="
                            font-size: small;
                            padding-left: 15px;
                        "
                    >
                        <span
                            >Valor numerio de diez digitos.
                            Ejem: 1254789652</span
                        >
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <input
                        class="form-control"
                        type="text"
                        name="nombreLibro_"
                        id="i_nombre"
                        value=""
                        placeholder="Nombre del libro"
                        required
                    />
                    <div
                        class="text-secondary"
                        style="
                            font-size: small;
                            padding-left: 15px;
                        "
                    >
                        <span
                            >No debe contener solo valores
                            numericos. Ejem: Cien años de
                            soledad.</span
                        >
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <input
                        class="form-control"
                        type="text"
                        name="autor_"
                        id="i_autor"
                        value=""
                        placeholder="Autor"
                        required
                    />
                    <div
                        class="text-secondary"
                        style="
                            font-size: small;
                            padding-left: 15px;
                        "
                    >
                        <span
                            >Nombre propio o pseudonimo.
                            Ejem: Gabriel Garci­a Marquez o
                            Pepito71.</span
                        >
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <input
                        class="form-control"
                        type="text"
                        name="anioPublicacion_"
                        id="i_anio"
                        value=""
                        placeholder="Año de publicación"
                        required
                    />
                    <div
                        class="text-secondary"
                        style="
                            font-size: small;
                            padding-left: 15px;
                        "
                    >
                        <span
                            >Valor numerico de 4 digitos.
                            Ejem: 1999</span
                        >
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <input
                        class="form-control"
                        type="text"
                        name="precio_"
                        id="i_precio"
                        value=""
                        placeholder="Precio"
                        required
                    />
                    <div
                        class="text-secondary"
                        style="
                            font-size: small;
                            padding-left: 15px;
                        "
                    >
                        <span
                            >Valor numerico entero o decimal
                            de dos decimales. Ejem: 15 o
                            22.99</span
                        >
                    </div>
                </div>
                <div class="d-flex flex-column">
                    <input
                        class="form-control"
                        type="number"
                        name="unidades_"
                        id="i_unidades"
                        value=""
                        max="100"
                        min="1"
                        placeholder="Unidades disponibles"
                        required
                    />
                    <div
                        class="text-secondary"
                        style="
                            font-size: small;
                            padding-left: 15px;
                        "
                    >
                        <span
                            >Valor numerico entero de 1 a
                            100.</span
                        >
                    </div>
                </div>
            </div>
            <div class="border opacity-25"></div>
            <span
                class="text-secondary"
                style="font-size: small"
                >* Verfique la valides de los datos antes de
                enviar las modificaciones
            </span>
            <div
                class="d-flex justify-content-between gap-3 m-0"
            >
                <button
                    style="width: 100%"
                    class="btn btn-secondary btn-primary"
                    type="submit"
                    id="btn-enviar-datos"
                    disabled
                >
                    Ingresar libro
                </button>
            </div>
        </form>
        <form
            class="row gap-3 m-0"
            action="SvLibrosDisponibles"
            method="POST"
        >
            <button
                class="col btn btn-primary"
                type="button"
                data-bs-toggle="modal"
                data-bs-target="#alertRequeriments"
                id="validarDatos"
            >
                Verificar para modificar
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
<!-- Modal -->
<div
    class="modal fade"
    id="alertRequeriments"
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
                    class="modal-title fs-5"
                    id="staticBackdropLabel"
                    hidden
                ></h1>
                <h1
                    class="modal-title fs-5"
                    id="title-alert"
                ></h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
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
                >
                    Continuar
                </button>
            </div>
        </div>
    </div>
</div>
<!-- -------- -->