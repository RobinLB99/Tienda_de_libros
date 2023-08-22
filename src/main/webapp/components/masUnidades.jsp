<%@page import="Logica.Libro"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<% Libro libro = (Libro) request.getSession().getAttribute("libroAModificar"); %>
<!-- AÃ±adir unidades al libro -->
<div class="card shadow-sm agregar-unidades-libros">
    <div class="card-header">Agregar unidades al libro</div>
    <div class="card-body card-body-agregar-unidades">
        <h5 class="card-title"><%= libro.getNombre() %></h5>
        <div
            class="d-flex flex-row gap-3 align-items-center"
        >
            <input
                type="text"
                name="idLibro"
                id="idLibro"
                value="<%= libro.getId() %>"
                hidden
            />
            <ul
                class="list-group list-group-flush d-flex align-items-center"
            >
                <li
                    class="list-group-item d-flex flex-row gap-3 align-items-center"
                >
                    <p class="h6 m-0">
                        <strong
                            >Unidades disponibles:</strong
                        >
                    </p>
                    <p class="m-0"><%= libro.getUnidades() %> unidades</p>
                </li>
            </ul>
            <ul
                class="list-group list-group-flush d-flex align-items-center"
            >
                <li
                    class="list-group-item d-flex flex-row gap-3 align-items-center"
                >
                    <p class="h6 m-0">
                        <strong>Unidades a agregar:</strong>
                    </p>
                    <form class="d-flex flex-row gap-3 m-0">
                        <input
                            class="form-control m-0"
                            type="number"
                            name="mas-unidades"
                            id="unidades-agregar"
                            value="1"
                            min="1"
                            max="50"
                        />
                        <button
                            class="btn btn-primary"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop"
                            id="btn-agregar-unidades"
                        >
                            Agregar
                        </button>
                    </form>
                    <form
                        class="d-flex flex-row gap-3 m-0"
                        action="SvLibrosDisponibles" method="POST"
                    >
                        <button
                            class="btn btn-danger"
                            type="submit"
                        >
                            Cancelar
                        </button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- Modal -->
<div
    class="modal fade"
    id="staticBackdrop"
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
                >
                    Agregar unidades
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <span class="m-0"
                    >Se agregaran
                    <strong id="t-masUnidades"
                        ># unidades</strong
                    >
                    del libro
                    <strong><%= libro.getNombre() %></strong></span
                >
                <span>¿Esta seguro de continuar?</span>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                >
                    Cerrar
                </button>
                <form action="SvAgregarUnidadesLibro" method="POST">
                    <input
                        type="text"
                        id="f-idLibro"
                        name="agregar_"
                        value="<%= libro.getId() %>"
                        hidden
                    />
                    <input
                        type="text"
                        id="f-unidadesAgregar"
                        name="masUnidades_"
                        value=""
                        hidden
                    />
                    <button
                        type="submit"
                        class="btn btn-primary"
                        id="btn_enviarDatosModal"
                    >
                        Confirmar
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- -------------- -->