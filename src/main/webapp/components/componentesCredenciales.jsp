<%@page import="Logica.Empleado"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%
    Empleado empleado = (Empleado) request.getSession().getAttribute("empleado");
%>
<div class="card shadow-sm" id="card-user">
    <div class="card-header">Gestión de usuario</div>
    <div class="card-body">
        <h5><%= empleado.getNombre() %> <%= empleado.getApellidos() %></h5>
        <div id="personaSinCredenciales">
            <%
            if (empleado.getCredencial().getUserName().equals("-")) {
            %>
            <span class="row text-secondary m-0"
                >Empleado sin credenciales.</span
            >
            <div
                class="d-flex justify-content-end gap-3 mt-3"
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
                        class="btn btn-primary"
                        type="button"
                        id="createCredentials"
                    >
                        Crear credenciales
                    </button>
                </div>
            </div>
            <%
            } else {
            %>
            Hola mundo
            <%
            }
            %>
        </div>
        <div id="credencialesConcedidas" hidden></div>
    </div>

    <!-- Modal crear credenciales -->
    <div
        class="modal fade"
        id="modalCrearCredenciales"
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
                        Crear credenciales
                    </h1>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                    ></button>
                </div>
                <div class="modal-body">
                    <form
                        action="SvCrearCredenciales"
                        method="POST"
                        class="form-credentials d-flex flex-column gap-3 mb-3"
                    >
                        <label class="container p-0">
                            <input
                                type="text"
                                name="userId_"
                                id="userId"
                                value="<%= empleado.getCredencial().getId() %>"
                                hidden
                            />
                            <input
                                type="text"
                                name="nameUser_"
                                id="nameUser"
                                class="form-control"
                                placeholder="Nombre de usuario"
                                required
                            />
                            <span
                                class="text-secondary"
                                id="txt-nameUser"
                                >Mínimo 5 letras minúsculas seguido de 2 números. Ejem:
                                pepito71</span
                            >
                        </label>
                        <label class="container p-0">
                            <input
                                type="password"
                                name="password_"
                                id="password"
                                class="form-control"
                                placeholder="Contraseña"
                                required
                            />
                            <span
                                class="text-secondary"
                                id="txt-password"
                                >Ingrese una contraseña, mínimo 3 caracteres.
                                Ejem: @pepito.71</span
                            >
                        </label>
                        <label class="container p-0">
                            <select
                                class="form-select"
                                name="typeAccess_"
                                id="typeAccess"
                            >
                                <option value="0">
                                    ---- Tipo de acceso ----
                                </option>
                                <option value="1">
                                    Acceso de administrador
                                </option>
                                <option value="2">
                                    Acceso normal
                                </option>
                            </select>
                            <span
                                class="text-secondary"
                                id="txt-access"
                                >Elija el tipo de acceso que
                                le quiere dar al
                                usuario.</span
                            >
                        </label>
                        <div class="container-fluid p-0">
                            <div
                                class="border opacity-25 mb-3"
                            ></div>
                            <div class="d-flex flex-row gap-3 m-0">
                                <button
                                    class="btn btn-primary"
                                    type="button"
                                    id="verficarDatosCredenciales"
                                >
                                    Verificar datos
                                </button>
                                <button
                                    class="btn btn-secondary"
                                    type="submit"
                                    id="enviarCredenciales"
                                    disabled
                                >
                                    Crear credenciales
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>