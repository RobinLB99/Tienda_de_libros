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
            <div id="credencialesConcedidas">
                <ul
                    class="nav nav-tabs"
                    id="myTab"
                    role="tablist"
                >
                    <li class="nav-item" role="presentation">
                        <button
                            class="nav-link active"
                            id="data-tab"
                            data-bs-toggle="tab"
                            data-bs-target="#data-tab-pane"
                            type="button"
                            role="tab"
                            aria-controls="data-tab-pane"
                            aria-selected="true"
                        >
                            Datos
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button
                            class="nav-link"
                            id="change-access-tab"
                            data-bs-toggle="tab"
                            data-bs-target="#change-access-tab-pane"
                            type="button"
                            role="tab"
                            aria-controls="change-access-tab-pane"
                            aria-selected="false"
                        >
                            Cambiar permisos
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button
                            class="nav-link"
                            id="recover-password-tab"
                            data-bs-toggle="tab"
                            data-bs-target="#recover-password-tab-pane"
                            type="button"
                            role="tab"
                            aria-controls="recover-password-tab-pane"
                            aria-selected="false"
                        >
                            Recuperar contraseña
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button
                            class="nav-link"
                            id="delete-tab"
                            data-bs-toggle="tab"
                            data-bs-target="#delete-tab-pane"
                            type="button"
                            role="tab"
                            aria-controls="delete-tab-pane"
                            aria-selected="false"
                        >
                            Eliminar credencial
                        </button>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div
                        class="tab-pane fade show active px-3"
                        id="data-tab-pane"
                        role="tabpanel"
                        aria-labelledby="data-tab"
                        tabindex="0"
                    >
                        <div class="row mb-3 mt-3">
                            <div class="col-2">
                                <strong
                                    >Nombre de usuario:</strong
                                >
                            </div>
                            <div class="col-6">
                                <span><%=empleado.getCredencial().getUserName()%></span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <strong>Privilegios:</strong>
                            </div>
                            <div class="col-6">
                                <%
                                String privilegio;
                                if (empleado.getCredencial().isAdmin()) {
                                    privilegio = "Administrador";
                                } else {
                                    privilegio = "Normal";
                                }
                                %>
                                <span><%=privilegio%></span>
                            </div>
                        </div>
                    </div>
                    <div
                        class="tab-pane fade"
                        id="change-access-tab-pane"
                        role="tabpanel"
                        aria-labelledby="change-access-tab-pane"
                        tabindex="0"
                    >
                        <div class="row mb-3 mt-3">
                            <form action="#" method="post">
                                <input
                                    type="text"
                                    name="id_"
                                    value="<%=empleado.getCredencial().getId()%>"
                                    hidden
                                />
                                <span>Permisos:</span>
                                <select
                                    style="
                                        height: 40px;
                                        border-radius: 50px;
                                    "
                                    class="form-select mt-1 mb-3"
                                    name="permisos_"
                                    id="permisos"
                                >
                                    <option value="0">
                                        ----- Tipo de permisos
                                        -----
                                    </option>
                                    <option value="admin">
                                        Administrador
                                    </option>
                                    <option value="normal">
                                        Normal
                                    </option>
                                </select>
                                <div
                                    class="d-flex flex-row justify-content-end gap-3 m-0"
                                >
                                    <button
                                        class="btn btn-primary"
                                        type="button"
                                        id="val-permisos"
                                    >
                                        Validar
                                    </button>
                                    <button
                                        class="btn btn-secondary"
                                        type="submit"
                                        id="cambiar-permisos"
                                        disabled
                                    >
                                        Cambiar privilegios
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div
                        class="tab-pane fade"
                        id="recover-password-tab-pane"
                        role="tabpanel"
                        aria-labelledby="recover-password-tab-pane"
                        tabindex="0"
                    >
                        <div class="row mb-3 mt-3">
                            <form
                                class="d-flex flex-column"
                                action="SvChangePassword"
                                method="post"
                            >
                                <span>Nueva contraseña:</span>
                                <label>
                                    <input
                                        type="text"
                                        name="id_"
                                        value="<%=empleado.getCredencial().getId()%>"
                                        hidden
                                    />
                                    <input
                                        style="
                                            border-radius: 50px;
                                            height: 40px;
                                        "
                                        class="form-control mt-1"
                                        type="password"
                                        name="password_"
                                        id="new-password"
                                        placeholder="Introduzca la nueva contraseña"
                                    />
                                    <span
                                        style="font-size: 12px"
                                        class="px-2 mb-3 text-secondary"
                                        id="span-password"
                                        >Todo tipo de caracteres
                                        a excepción de
                                        espacios.</span
                                    >
                                </label>
                                <div
                                    class="d-flex flex-row justify-content-end gap-3 m-0"
                                >
                                    <button
                                        class="btn btn-primary"
                                        type="button"
                                        id="val-password"
                                    >
                                        Validar
                                    </button>
                                    <button
                                        class="btn btn-secondary"
                                        type="submit"
                                        id="btn-cambiar-password"
                                        disabled
                                    >
                                        Cambiar contraseña
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div
                        class="tab-pane fade"
                        id="delete-tab-pane"
                        role="tabpanel"
                        aria-labelledby="delete-tab-pane"
                        tabindex="0"
                    >
                        <p class="mt-3">
                            Cuidado! Esta opción elimina las credenciales.
                        </p>
                        <div
                            class="d-flex gap-3 justify-content-end"
                        >
                            <button
                                class="btn btn-danger"
                                type="button"
                                data-bs-toggle="modal"
                                data-bs-target="#modalConfirmDelete"
                            >
                                Eliminar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>
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
                                
<!-- Modal validaciones -->
<div
    class="modal fade"
    id="modalConfirmValidations"
    data-bs-backdrop="static"
    data-bs-keyboard="false"
    tabindex="-1"
    aria-labelledby="titleModalValidation"
    aria-hidden="true"
>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1
                    class="modal-title fs-5"
                    id="titleModalValidation"
                >
                    Modal title
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <p id="messageModal">...</p>
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

<!-- Modal confirmar eliminación -->
<div
    class="modal fade"
    id="modalConfirmDelete"
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
                    Eliminar credencial
                </h1>
                <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                    aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">
                <p>Está por eliminar esta credencial.<br />¿Esta seguro de continuar?</p>
            </div>
            <div class="modal-footer">
                <form action="SvEliminarCredencial" method="post">
                    <input
                        type="text"
                        name="id_"
                        value="<%= empleado.getCredencial().getId() %>"
                        hidden
                    />
                    <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal"
                    >
                        Cancelar
                    </button>
                    <button
                        type="submit"
                        class="btn btn-primary"
                    >
                        Continuar
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>