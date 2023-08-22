<%@page import="java.util.List"%>
<%@page import="Logica.Libro"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<!-- Tabla de libros -->
<div class="card m-0 card-tabla shadow-sm">
    <div class="card-header text-primary">
        Libros disponibles
    </div>
    <div class="card-body card-tabla-body">
        <table
            class="table"
            id="TablaLibros"
            class="display"
            style="width: 100%"
        >
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Autor</th>
                    <th>Año de publicación</th>
                    <th>Precio</th>
                    <th>Cantidad disponible</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Libro> libros = (List) request.getSession().getAttribute("listaLibros");
                    
                    for (Libro libro : libros) {
                %>
                <tr>
                    <td><%= libro.getCodigo() %></td>
                    <td><%= libro.getNombre() %></td>
                    <td><%= libro.getAutor() %></td>
                    <td><%= libro.getAnio() %></td>
                    <td>$<%= libro.getPrecio() %></td>
                    <td><%= libro.getUnidades() %> unidades</td>
                    <td>
                        <div class="d-flex flex-row gap-3">
                            <form action="SvRedirigirAgregarUnidad" method="POST">
                                <input
                                    type="text"
                                    name="idLibro_"
                                    value="<%= libro.getId() %>"
                                    hidden
                                />
                                <button
                                    type="submit"
                                    class="btn btn-success"
                                >
                                    <i
                                        class="fa-solid fa-plus"
                                    ></i>
                                </button>
                            </form>
                            <form action="SvRedirectModificarLibro" method="POST">
                                <input
                                    type="text"
                                    name="modificar_"
                                    value="<%= libro.getId() %>"
                                    hidden
                                />
                                <button
                                    type="submit"
                                    class="btn btn-primary"
                                >
                                    <i
                                        class="fa-regular fa-pen-to-square"
                                    ></i>
                                </button>
                            </form>
                            <form action="SvEliminarLibro" method="GET">
                                <input
                                    type="text"
                                    value="<%= libro.getId() %>"
                                    name="eliminar_"
                                    hidden
                                />
                                <button
                                    type="submit"
                                    class="btn btn-danger"
                                >
                                    <i
                                        class="fa-regular fa-trash-can"
                                    ></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Autor</th>
                    <th>Año de publicación</th>
                    <th>Precio</th>
                    <th>Cantidad disponible</th>
                    <th>Opciones</th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
<!-- -------------- -->