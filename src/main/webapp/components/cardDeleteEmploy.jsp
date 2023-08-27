<%@page import="Logica.LogicController"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Empleado"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%
    LogicController control = new LogicController();
    Empleado empleado = (Empleado) request.getSession().getAttribute("empleadoEliminar");
    
    String cargo = null;
    String userName = null;
    
    if (empleado.getUsuario().getUserName().equals("-")) {
        userName = "<span class='text-secondary m-0' style='width: fit-content;'>No asignado</span>";
    } else {
        userName = empleado.getUsuario().getUserName();
    }

    if (empleado.getFuncion().equals("admin")) {
        cargo = "Administrador";
    }

    if (empleado.getFuncion().equals("cajero")) {
        cargo = "Cajero";
    }

    if (empleado.getFuncion().equals("perchero")) {
        cargo = "Perchero";
    }

    /* Convertir Fecha en fecha corta */
    Date fecha = empleado.getFechaNacimiento();
    String fechaCorta = control.getShortDateString(fecha);
%>
<div class="card shadow-sm" id="cardDeleteEmploy">
    <div class="card-header">Empleado a eliminar</div>
    <div class="card-body">
        <div
            class="contenido row row-cols-1 row-cols-lg-2 g-lg-3 mb-3"
            style="width: 100%"
        >
            <div class="col">
                <p class="row m-0">
                    <strong class="col-5">Cédula: </strong
                    ><span class="col"><%= empleado.getCedula() %></span>
                </p>
                <p class="row m-0">
                    <strong class="col-5">Nombres: </strong
                    ><span class="col"><%= empleado.getNombre() %></span>
                </p>
                <p class="row m-0">
                    <strong class="col-5"
                        >Apellidos: </strong
                    ><span class="col"><%= empleado.getApellidos() %></span>
                </p>
                <p class="row m-0">
                    <strong class="col-5"
                        >F. Nacimiento: </strong
                    ><span class="col"><%= fechaCorta %></span>
                </p>
            </div>
            <div class="col">
                <p class="row m-0">
                    <strong class="col-5">Cargo:</strong
                    ><span class="col"><%= cargo %></span>
                </p>
                <p class="row m-0">
                    <strong class="col-5">Teléfono: </strong
                    ><span class="col"><%= empleado.getTelefono() %></span>
                </p>
                <p class="row m-0">
                    <strong class="col-5">Usuario: </strong
                    ><span class="col"><%= userName %></span>
                </p>
            </div>
        </div>
        <div class="d-flex align-items-end">
            <div
                class="actions d-flex gap-3 justify-content-end"
                style="width: 100%"
            >
                <form action="SvRedirigirGestionEmpleados" method="POST">
                    <button
                        class="btn btn-secondary"
                        type="submit"
                    >
                        Cancelar
                    </button>
                </form>
                <div>
                    <button
                        class="btn btn-danger"
                        type="button"
                        id="eliminarE"
                    >
                        Eliminar
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<div
    class="modal fade"
    id="modalEliminarEmpleado"
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
                    Eliminar empleado
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
                    >Eliminara a
                    <strong><%= empleado.getNombre() %> <%= empleado.getApellidos() %></strong>
                    del registro.</span
                >
                <br />
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
                <form action="SvEliminarEmpleado" method="POST">
                    <input
                        type="text"
                        name="id_empleado"
                        value="<%= empleado.getId() %>"
                        hidden
                    />
                    <input
                        type="text"
                        name="id_credentials"
                        value="<%= empleado.getUsuario().getId() %>"
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