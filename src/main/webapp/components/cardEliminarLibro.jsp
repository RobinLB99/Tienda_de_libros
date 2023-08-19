<%@page import="Logica.Libro"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%
    Libro book = (Libro) request.getSession().getAttribute("libroEliminar");
%>
<!-- ELiminar un libro -->
<div
    class="card shadow-sm m-auto"
    style="max-width: 80%; width: 100%"
>
    <div class="card-header">Eliminar libro</div>
    <div class="card-body d-flex justify-content-between">
        <div class="m-0 p-0 row">
            <div class="col">
                <span><%= book.getCodigo() %></span><br>
                <span><%= book.getNombre() %></span><br>
                <span><%= book.getAutor() %></span><br>
            </div>
            <div class="col-4">
                <span><%= book.getAnio() %></span><br>
                <span><%= book.getPrecio() %></span><br>
                <span><%= book.getUnidades() %></span>
            </div>
        </div>
        <div class="botones d-flex gap-2 align-items-center">
            <form action="SvLibrosDisponibles" method="GET">
                <button
                    class="btn btn-secondary"
                    type="submit"
                >
                    Cancelar
                </button>
            </form>
            <div>
                <button
                    type="button"
                    class="btn btn-danger"
                    data-bs-toggle="modal"
                    data-bs-target="#staticBackdropModalDeleteBook"
                    id="btn-eliminar-libro"
                >
                    Eliminar
                </button>
            </div>
        </div>
    </div>
</div>
<div
    class="modal fade"
    id="staticBackdropModalDeleteBook"
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
                    Eliminar libro
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <p>Se eliminar <strong><%= book.getNombre() %></strong> del inventario. <br>
                ¿Está segúro de continuar?</p>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-dismiss="modal"
                >
                    Cerrar
                </button>
                <form action="SvEliminarLibro" method="POST">
                    <input
                        type="text"
                        name="id_book_delete"
                        value="<%= book.getId() %>"
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