<%@page import="java.util.Date"%>
<%@page import="Logica.LogicController"%>
<%@page import="java.lang.String"%>
<%@page import="Logica.Libro"%>
<%@page import="Logica.CantidadLibroPedido"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Cliente"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%
    LogicController control = new LogicController();
    Cliente cliente = (Cliente) request.getSession().getAttribute("dataCliente");
    List<CantidadLibroPedido> librosPedidos = (List) request.getSession().getAttribute("listaCantidadLibrosPedidos");
    String typeOfClient_ = (String) request.getSession().getAttribute("typeOfClient");
                
    String nFactura = (String) request.getSession().getAttribute("numFactura");
    double total = 0;
%>
<div class="card" style="height: 100% !important; overflow: hidden; overflow-y: visible;">
    <div class="card-body">
        <h5 class="card-title">Facturar venta</h5>
        <p class="card-text">
            Confirme la facturación del venta del libro.
        </p>
        <div class="border opacity-25"></div>
        <div class="d-flex flex-row gap-3">
            <div class="content-data-facture p-3" id="factura_">
                <section class="factura py-3">
                    <div class="header">
                        <h3 class="m-0">Factura de venta</h3>
                        <p class="h5 m-0">Librería</p>
                        <p class="m-0"><strong>N.Factura: </strong><%=nFactura%></p>
                        <div class="border my-2"></div>
                        <fieldset class="section">
                            <legend class="h2"><strong>Datos del Cliente</strong></legend>
                            <%
                                if (!typeOfClient_.equals("0")) {
                            %>
                            <div class="customer-info">
                                <div class="label">Cédula:</div>
                                <div class="data m-0">
                                    <%=cliente.getCedula()%>
                                </div>
                                <div class="label m-0">
                                    Nombres:
                                </div>
                                <div class="data m-0"><%=cliente.getNombre()%></div>
                                <div class="label m-0">
                                    Apellidos:
                                </div>
                                <div class="data m-0">
                                    <%=cliente.getApellidos()%>
                                </div>
                                <div class="label m-0">
                                    Teléfono:
                                </div>
                                <div class="data m-0">
                                    <%=cliente.getTelefono()%>
                                </div>
                                <div class="label m-0">
                                    Dirección:
                                </div>
                                <div class="data m-0">
                                    <%=cliente.getDireccion()%>
                                </div>
                            </div>
                            <%
                                } else {
                            %>
                            <p class="text-card">Consumidor final</p>
                            <%
                                }
                            %>
                        </fieldset>
                        <fieldset class="section">
                            <legend class="h2"><strong>Datos del Libro</strong></legend>
                            <div class="row">
                                <div class="col m-0"><strong>Libro</strong></div>
                                <div class="col m-0"><strong>Precio</strong></div>
                                <div class="col m-0"><strong>Cantidad</strong></div>
                                <div class="col m-0"><strong>V.Total</strong></div>
                            </div>
                            <div class="border opacity-25 m-0"></div>
                            <%
                                for (CantidadLibroPedido nlibros : librosPedidos) {
                            %>
                            <div class="row">
                                <div class="col m-0"><%=nlibros.getLibro().getNombre()%></div>
                                <%
                                    double plibro = nlibros.getLibro().getPrecio();
                                    double vATotal = plibro * (nlibros.getCantidad());
                                %>
                                <div class="col m-0">$<%=plibro%></div>
                                <div class="col m-0"><%=nlibros.getCantidad()%></div>
                                <div class="col m-0">$<%= vATotal %></div>
                            </div>
                            <%
                                total += vATotal;
                                }
                                HttpSession vTotalInvoice = request.getSession();
                                vTotalInvoice.setAttribute("vTotalInvoice", vTotalInvoice);
                            %>
                        </fieldset>
                        <div class="border opacity-50 my-2"></div>
                        <div class="section">
                            <div class="row">
                                <div class="col m-0"><strong>TOTAL:</strong></div>
                                <div class="col m-0"></div>
                                <div class="col m-0"></div>
                                <div class="col m-0"><strong>$<%=total%></strong></div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="border opacity-50"></div>
            <div class="fluid-content p-3">
                <form action="SvMenuPrincipal" method="POST">
                    <button class="btn btn-secondary" type="submit">Cancelar</button>
                    <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#ConfirmPaid">Confirmar pago</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="ConfirmPaid" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Recibir pago</h1>
                <button type="button" class="btn-close" id="x-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                El valor total de la factura es de <strong>$<%=total%></strong>. <br>
                Confirme el pago para continuar.
            </div>
            <form action="SvIngresarFacturaVenta" method="post" class="modal-footer">
                <input type="text" name="valorFactura_" value="<%=total%>" hidden>
                <button type="button" class="btn btn-secondary" id="close" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" id="retrivePaid">Pago recibido</button>
                <button type="submit" class="btn btn-primary" id="continue" disabled>Continuar</button>
            </form>
        </div>
    </div>
</div>