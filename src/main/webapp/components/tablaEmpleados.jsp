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
                
                    String cargo = null;
                    String userName = null;
                    
                    /* Convertir Fecha en fecha corta */
                    Date fecha = empleado.getFechaNacimiento();
                    String fechaCorta = control.getShortDateString(fecha);
                    
                    
                    if (empleado.getCredencial().getUserName().equals("-")) {
                        userName = "<p class='text-secondary m-0'>No asignado</p>";
                    } else {
                        userName = empleado.getCredencial().getUserName();
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

                %>
                <tr>
                    <td><%= empleado.getCedula() %></td>
                    <td><%= empleado.getNombre() %></td>
                    <td><%= empleado.getApellidos() %></td>
                    <td><%= fechaCorta %></td>
                    <td><%= cargo %></td>
                    <td><%= empleado.getTelefono() %></td>
                    <td><%= userName %></td>
                    <td>
                        <div class="d-flex flex-row gap-3">
                            <form action="SvRedirigirGestionCredenciales" method="POST">
                                <input
                                    type="text"
                                    name="id_usuario_empleado"
                                    value="<%= empleado.getId() %>"
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
                                    value="<%= empleado.getId() %>"
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
                                    value="<%= empleado.getId() %>"
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