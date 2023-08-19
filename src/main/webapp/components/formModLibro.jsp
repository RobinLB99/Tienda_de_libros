<%@page import="Logica.Libro"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>

<!-- Modificar libro -->
<div class="card shadow-sm card-modificar-libro">
    <div class="card-header">Modificar datos del libro</div>
    <div class="card-body card-body-modificar-libro">
        <form
            action="SvModificarLibro"
            method="POST"
            class="d-flex flex-column justify-content-center formulario-modificar-libro"
        >
            <% Libro libro = (Libro) request.getSession().getAttribute("libro_"); %>
            <input
                type="text"
                name="id_"
                id="i_id"
                value="<%=libro.getId()%>"
                hidden
            />
            <input
                class="form-control m-0"
                type="text"
                name="codigo_"
                id="i_code"
                value="<%=libro.getCodigo()%>"
                placeholder="Codigo"
                required
            />
            <span
                class="text-secondary mb-3"
                style="font-size: small; padding-left: 15px"
            >
                Valor numerio de diez digitos. Ejem: 1254789652
            </span>
            <input
                class="form-control m-0"
                type="text"
                name="nombre_"
                id="i_nombre"
                value="<%=libro.getNombre()%>"
                placeholder="Nombre del libro"
                required
            />
            <span
                class="text-secondary mb-3"
                style="font-size: small; padding-left: 15px"
                >No debe contener solo valores numericos. Ejem: Cien años de
                soledad.</span
            >
            <input
                class="form-control m-0"
                type="text"
                name="autor_"
                id="i_autor"
                value="<%=libro.getAutor()%>"
                placeholder="Autor"
                required
            />
            <span
                class="text-secondary mb-3"
                style="font-size: small; padding-left: 15px"
                >Nombre propio o pseudonimo. Ejem: Gabriel García Márquez o
                Pepito71.</span
            >
            <input
                class="form-control m-0"
                type="text"
                name="anio_"
                id="i_anio"
                value="<%=libro.getAnio()%>"
                placeholder="Año de publicación"
                required
            />
            <span
                class="text-secondary mb-3"
                style="font-size: small; padding-left: 15px"
                >Valor numerico de 4 digitos. Ejem: 1999</span
            >
            <input
                class="form-control m-0"
                type="text"
                name="precio_"
                id="i_precio"
                value="<%=libro.getPrecio()%>"
                placeholder="Precio"
                required
            />
            <span
                class="text-secondary mb-3"
                style="font-size: small; padding-left: 15px"
                >Valor numerico entero o decimal de dos decimales. Ejem: 15 o
                22.99</span
            >
            <input
                class="form-control m-0"
                type="number"
                name="unidades_"
                id="i_unidades"
                min="1"
                max="100"
                value="<%=libro.getUnidades()%>"
                placeholder="Unidades disponibles"
                required
            />
            <span
                class="text-secondary mb-3"
                style="font-size: small; padding-left: 15px"
                >Valor numerico entero de 1 a 100.</span
            >
            <div class="border opacity-25 mb-3"></div>
            <span class="text-secondary mb-3" style="font-size: small"
                >* Verfique la valides de los datos antes de enviar las
                modificaciones
            </span>
            <div class="row m-0 mb-3 botones-mod-libro">
                <button
                    class="btn btn-primary"
                    type="button"
                    data-bs-toggle="modal"
                    data-bs-target="#alertRequeriments"
                    id="validarDatos"
                >
                    Verificar para modificar
                </button>
            </div>
            <div class="d-flex justify-content-between gap-3 mb-3">
                <form
                    style="width: 100%"
                    action="SvLibrosDisponibles"
                    method="POST"
                >
                    <button
                        style="width: 100%"
                        class="btn btn-secondary"
                        type="submit"
                    >
                        Cancelar
                    </button>
                </form>
                <button
                    style="width: 100%"
                    class="btn btn-secondary btn-primary"
                    type="submit"
                    id="btn-modificarLibro"
                    disabled
                >
                    Modificar libro
                </button>
            </div>
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
                <h1 class="modal-title fs-5" id="title-alert"></h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <span class="m-0 text-secondary" id="message_"></span>
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
