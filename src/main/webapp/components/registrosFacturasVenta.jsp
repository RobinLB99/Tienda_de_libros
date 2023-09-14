<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Logica.Venta"%>
<%@page import="Logica.CantidadLibroPedido"%>
<%@page import="java.util.List"%>
<%
    List<Venta> registros = (List) request.getSession().getAttribute("registroVentas");
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
        <h5 class="card-title">Registro de ventas</h5>
        <p class="card-text">
            Registro de ventas de libros por empleado
            efectuados.
        </p>
        <div class="border opacity-25 mb-3"></div>
        <table
            class="table table-register-invoce"
            id="TablaRegistroVentas"
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
                </tr>
            </thead>
            <tbody>
                <% for (Venta registro : registros) {
                        int cantidadLibros = 0;
                        List<CantidadLibroPedido> libros = registro.getLibrosPedidos();

                        for (CantidadLibroPedido cl : libros) {
                            cantidadLibros += cl.getCantidad();
                        }
                %>
                <tr>
                    <td><%= registro.getNumFactura()%></td>
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
                                        <%= cl.getLibro().getNombre()%>
                                    </div>
                                    <div class="col">
                                        <%= cl.getCantidad()%>
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
                    <td><%= registro.getCliente().getNombre()%> <%= registro.getCliente().getApellidos()%></td>
                    <td>$ <%= registro.getValorFactura()%></td>
                    <td><%= registro.getEmpleado().getNombre()%> <%= registro.getEmpleado().getApellidos()%></td>
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
                </tr>
            </tfoot>
        </table>
    </div>
</div>