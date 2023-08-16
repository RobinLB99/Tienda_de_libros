<%@page import="Logica.Libro"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<div class="card m-0 card-tabla shadow-sm">
    <div class="card-header text-primary">
        Libros disponibles
    </div>
    <div class="card-body card-tabla-body">
        <%
            List<Libro> libros = (List) request.getSession().getAttribute("listaLibros");
        %>
        <table class="table" id="TablaLibros" class="display" style="width: 100%" >
            <thead>
                <tr>
                    <th>Codigo</th>
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
                    for (Libro book : libros) {
                %>
                <tr>
                    <td><%= book.getCodigo() %></td>
                    <td><%= book.getNombre() %></td>
                    <td><%= book.getAutor() %></td>
                    <td><%= book.getAnio() %></td>
                    <td>$<%= book.getPrecio() %></td>
                    <td><%= book.getUnidades() %> unidades</td>
                    <td>
                        <div class="d-flex flex-row gap-3">
                            <form action="SvRedirigirAgregarUnidad" method="POST">
                                <input type="text" value="<%= book.getId() %>" name="agregar_" hidden>
                                <button
                                    type="submit"
                                    class="btn btn-success"
                                >
                                    <i
                                        class="fa-solid fa-plus"
                                    ></i>
                                </button>
                            </form>
                            <form action="#" method="POST">
                                <input type="text" value="<%= book.getId() %>" name="modificar_" hidden>
                                <button
                                    type="submit"
                                    class="btn btn-primary"
                                >
                                    <i
                                        class="fa-regular fa-pen-to-square"
                                    ></i>
                                </button>
                            </form>
                            <form action="#" method="POST">
                                <input type="text" value="<%= book.getId() %>" name="eliminar_" hidden>
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
                    <th>Codigo</th>
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