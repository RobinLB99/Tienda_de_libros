<%@page import="Logica.LogicController"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Empleado"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<div class="card m-0 card-tabla shadow-sm">
    <div class="card-header text-primary">
        Tabla de personal
    </div>
    <div class="card-body card-tabla-body">
        <table
            class="table"
            id="tablaEmpleados"
            >
            <thead>
                <tr>
                    <th>Cédula</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>F. nacimiento</th>
                    <th>Cargo</th>
                    <th>Teléfono</th>
                    <th>Usuario</th>
                    <th>Opciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Empleado> listaEmpleados = (List<Empleado>) request.getSession().getAttribute("listaEmpleados");
                    LogicController control = new LogicController();

                    for (Empleado empleado : listaEmpleados) {

                        String obtenerCargo = empleado.getFuncion();
                        String cargo = null;
                        String userName = null;

                        /* Convertir Fecha en fecha corta */
                        Date fecha = empleado.getFechaNacimiento();
                        String fechaCorta = control.getShortDateString(fecha);

                        userName = empleado.getCredencial().getUserName();

                        if (empleado.getCredencial().getUserName().equals("-")) {
                            userName = "<p class='text-secondary m-0'>No asignado</p>";
                        }

                        if (obtenerCargo.equals("admin")) {
                            cargo = "Administrador";
                        }
                        if (obtenerCargo.equals("cajero")) {
                            cargo = "Cajero";
                        }
                        if (obtenerCargo.equals("perchero"))
                            cargo = "Perchero";
                %>
                <tr>
                    <td><%= empleado.getCedula()%></td>
                    <td><%= empleado.getNombre()%></td>
                    <td><%= empleado.getApellidos()%></td>
                    <td><%= fechaCorta%></td>
                    <td><%= cargo%></td>
                    <td><%= empleado.getTelefono()%></td>
                    <td><%= userName%></td>
                    <td>
                        <div class="d-flex flex-row gap-3">
                            <form action="SvRedirigirGestionCredenciales" method="POST">
                                <input
                                    type="text"
                                    name="id_usuario_empleado"
                                    value="<%= empleado.getId()%>"
                                    hidden
                                    />
                                <button
                                    type="submit"
                                    class="btn btn-primary"
                                    >
                                    <i
                                        class="fa-solid fa-user"
                                        ></i>
                                </button>
                            </form>
                            <form action="SvRedirigirModificarEmpleado" method="POST">
                                <input
                                    type="text"
                                    name="id_usuario_empleado"
                                    value="<%= empleado.getId()%>"
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
                            <form action="SvRedirigirEliminarEmpleado" method="POST">
                                <input
                                    type="text"
                                    name="id_usuario_empleado"
                                    value="<%= empleado.getId()%>"
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
                    <th>Cédula</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>F. nacimiento</th>
                    <th>Cargo</th>
                    <th>Teléfono</th>
                    <th>Usuario</th>
                    <th>Opciones</th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>

<div
    class="modal fade"
    id="passwordChangedMessage"
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
                    Contraseña modificada
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                    ></button>
            </div>
            <div class="modal-body">
                <p class="text-card">
                    La contraseña se modifico con éxito. <br>
                    EL usuario deberá registrar una nueva contraseña el proximo inicio de sesión.
                </p>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-primary"
                    data-bs-dismiss="modal"
                    >
                    Entendido
                </button>
            </div>
        </div>
    </div>
</div>

<div
    class="modal fade"
    id="privilegiosCambiadosMensaje"
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
                    Privilegios modificados
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                    ></button>
            </div>
            <div class="modal-body">
                <p class="text-card">
                    El privilegio de usuario se modifico con éxito.
                </p>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-primary"
                    data-bs-dismiss="modal"
                    >
                    Entendido
                </button>
            </div>
        </div>
    </div>
</div>

<div
    class="modal fade"
    id="accessUserDelete"
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
                    Credencial eliminada
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                    ></button>
            </div>
            <div class="modal-body">
                <p class="text-card">
                    La credencial de acceso del usuario fue eliminada exitosamente.
                </p>
            </div>
            <div class="modal-footer">
                <button
                    type="button"
                    class="btn btn-primary"
                    data-bs-dismiss="modal"
                    >
                    Entendido
                </button>
            </div>
        </div>
    </div>
</div>