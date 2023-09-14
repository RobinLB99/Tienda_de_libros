<%@page import="Logica.CantidadLibroPedido"%>
<%@page import="Logica.Alquiler"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Alquiler> registros = (List) request.getSession().getAttribute("registroAlquiler");
%>
<div
    class="card shadow-sm"
    style="
    max-height: 100%;
    overflow: hidden;
    overflow-y: visible;
    "
    >
    <div class="card-body">
        <h5 class="card-title">Registro de alquiler</h5>
        <p class="card-text">
            Registro de alquiler de libros por empleado
            efectuados.
        </p>
        <div class="border opacity-25 mb-3"></div>
        <table
            class="table table-register-invoce"
            id="TablaRegistroAlquiler"
            class="display"
            style="width: 100%"
            >
            <thead>
                <tr>
                    <th>N.Factura</th>
                    <th>libros</th>
                    <th>Cliente</th>
                    <th>Valor de la factura</th>
                    <th>Empleado</th>
                    <th>Estado</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (Alquiler registro : registros) {                    
                    int cantidadLibros = 0;
                    List<CantidadLibroPedido> libros = registro.getLibrosPedidos();
                    
                    for (CantidadLibroPedido cl : libros) {
                        cantidadLibros += cl.getCantidad();
                    }
                %>
                <tr>
                    <td><%= registro.getNumFactura() %></td>
                    <td id="listaLibros">
                        <button
                            class="list m-0"
                            type="button"
                            tabindex="0"
                            data-bs-toggle="popover"
                            data-bs-trigger="hover focus"
                            data-bs-html="true"
                            data-bs-content='
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col">
                                        <strong>Libro</strong>
                                    </div>
                                    <div class="col">
                                        <strong>Cantidad</strong>
                                    </div>
                                </div>
                                <div class="border opacity-25"></div>
                                <%  for (CantidadLibroPedido cl : libros) {
                                %>
                                <div class="row">
                                    <div class="col">
                                        <%= cl.getLibro().getNombre() %>
                                    </div>
                                    <div class="col">
                                        <%= cl.getCantidad() %>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            '
                            >
                            <span><%=cantidadLibros%> Libro/libros</span>
                        </button>
                    </td>
                    <td><%= registro.getCliente().getNombre() %> <%= registro.getCliente().getApellidos()%></td>
                    <td>$ <%= registro.getValorFactura() %></td>
                    <td><%= registro.getEmpleado().getNombre() %> <%= registro.getEmpleado().getApellidos()%></td>
                    <td><%= registro.getEstadoAlquiler() %></td>
                    <td>
                        <div class="d-flex flex-row gap-3">
                            <button
                                type="button"
                                class="btn btn-primary ReceptarLibrosBTN d-flex gap-2 align-items-center"
                                data-bs-toggle="modal"
                                data-bs-target="#ReceptarLibros"
                                >
                                <input type="text" value="<%= registro.getId() %>" hidden>
                                <i
                                    class="fa-solid fa-book"
                                    ></i>
                                <span>Receptar libros</span>
                            </button>
                        </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <th>N.Factura</th>
                    <th>libros</th>
                    <th>Cliente</th>
                    <th>Valor de la factura</th>
                    <th>Empleado</th>
                    <th>Estado</th>
                    <th>Opciones</th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>

<div
    class="modal fade"
    id="ReceptarLibros"
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
                    Receptar libros
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                    ></button>
            </div>
            <div class="modal-body">
                Confirme antes de continuar.
                <br />
                ¿Ha recibido los libros?
            </div>
            <div class="modal-footer">
                <form action="#" method="post">
                    <input
                        type="text"
                        name="id_facturaAlquiler_"
                        id="ID_FacturaALquiler"
                        value=""
                        hidden
                        />
                    <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                        >
                        Cerrar
                    </button>
                    <button
                        type="submit"
                        class="btn btn-primary"
                        >
                        Confirmar
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
