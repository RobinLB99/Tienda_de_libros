<%@page import="Logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<div class="contenedor-contenido container-fluid p-0">
    <div class="card shadow-sm">
        <div class="card-body">
            <h5 class="card-title">Datos para transacción</h5>
            <p class="card-text">
                Complete los datos para completar la
                transacción.
            </p>
            <div class="border opacity-25"></div>
            <form
                action="#"
                method="post"
                class="container-fluid p-3"
            >
                <p class="card-text">Tipo de cliente</p>
                <div
                    class="d-flex flex-row gap-3 align-items-center"
                >
                    <div class="form-check">
                        <input
                            class="form-check-input"
                            type="radio"
                            name="typeClient"
                            id="type1"
                            value="0"
                        />
                        <label
                            class="form-check-label"
                            for="type1"
                        >
                            Consumidor final
                        </label>
                    </div>
                    <div class="form-check">
                        <input
                            class="form-check-input"
                            type="radio"
                            name="typeClient"
                            id="type2"
                            value="1"
                        />
                        <label
                            class="form-check-label"
                            for="type2"
                        >
                            Con datos
                        </label>
                    </div>
                    <button
                        type="button"
                        class="btn btn-primary"
                        id="selectClientButton"
                        data-bs-toggle="modal"
                        data-bs-target="#modalTablaCliente"
                        disabled
                    >
                        Seleccionar cliente
                    </button>
                    <p
                        class="text-secondary"
                        id="text-clientSelected"
                    >
                        Cliente no seleccionado
                    </p>
                    <input
                        type="text"
                        name="typeOfClient_"
                        id="typeOfClient"
                        hidden
                    />
                    <input
                        type="text"
                        name="idCliente_"
                        id="id_clienteSeleccionado"
                        hidden
                    />
                    <input
                        type="text"
                        name="datosNuevoCliente_"
                        id="datos_nuevoCliente"
                        hidden
                    />
                </div>
                <div class="border opacity-25 my-3"></div>
                <div class="container-fluid m-0 d-flex justify-content-end gap-3">
                    <button class="btn btn-secondary" type="button" id="verForFacture">Verificar</button>
                    <button type="submit" class="btn btn-primary" id="createFacture" disabled>Continuar</button>
                </div>
            </form>
        </div>
    </div>

    <div
        class="modal fade"
        id="modalTablaCliente"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        tabindex="-1"
        aria-labelledby="staticBackdropLabel"
        aria-hidden="true"
    >
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1
                        class="modal-title fs-5"
                        id="staticBackdropLabel"
                    >
                        Clientes
                    </h1>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                    ></button>
                </div>
                <div
                    class="modal-body"
                    style="overflow: hidden"
                >
                    <table
                        class="table"
                        id="TablaLibros"
                        class="display"
                        style="width: 100%"
                    >
                        <thead>
                            <tr>
                                <td></td>
                                <th>Cédula</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Teléfono</th>
                                <th>Dirección</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Cliente> clientes = (List) request.getSession().getAttribute("listaCLientes");
                                
                                if (clientes != null) for (Cliente cliente : clientes) {
                            %>
                            <tr>
                                <td>
                                    <input
                                        class="form-check-input ratioClient"
                                        type="radio"
                                        name="idCliente"
                                        value="1"
                                    />
                                </td>
                                <td>0944149020</td>
                                <td>Robin Joel</td>
                                <td>Lugo Boero</td>
                                <td>0968161160</td>
                                <td>Guayaquil</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td></td>
                                <th>Cédula</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Teléfono</th>
                                <th>Dirección</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div
                    class="modal-footer d-flex justify-content-end align-items-center gap-3"
                >
                    <button
                        type="button"
                        class="btn btn-success"
                        id="btnNuevoCliente"
                        data-bs-target="#newClientForm"
                        data-bs-toggle="modal"
                    >
                        Nuevo cliente
                    </button>
                    <button
                        type="button"
                        class="btn btn-primary"
                        id="seleccionarCliente"
                        data-bs-dismiss="modal"
                        disabled
                    >
                        Seleccionar
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div
        class="modal fade"
        id="newClientForm"
        data-bs-backdrop="static"
        data-bs-keyboard="false"
        aria-hidden="true"
        aria-labelledby="exampleModalToggleLabel2"
        tabindex="-1"
    >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1
                        class="modal-title fs-5"
                        id="exampleModalToggleLabel2"
                    >
                        Nuevo cliente
                    </h1>
                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                    ></button>
                </div>
                <div
                    class="modal-body d-flex flex-column gap-3"
                >
                    <input
                        class="form-control"
                        type="text"
                        id="nc_cedula"
                        style="
                            border-radius: 50px;
                            height: 40px;
                        "
                        placeholder="Cédula"
                    />
                    <input
                        class="form-control"
                        type="text"
                        id="nc_nombres"
                        style="
                            border-radius: 50px;
                            height: 40px;
                        "
                        placeholder="Nombres"
                    />
                    <input
                        class="form-control"
                        type="text"
                        id="nc_apellidos"
                        style="
                            border-radius: 50px;
                            height: 40px;
                        "
                        placeholder="Apellidos"
                    />
                    <input
                        class="form-control"
                        type="text"
                        id="nc_telefono"
                        style="
                            border-radius: 50px;
                            height: 40px;
                        "
                        placeholder="Teléfono"
                    />
                    <input
                        class="form-control"
                        type="text"
                        id="nc_direccion"
                        style="
                            border-radius: 50px;
                            height: 40px;
                        "
                        placeholder="Dirección"
                    />
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" id="validarNuevoCliente">
                        Validar datos
                    </button>
                    <button
                        class="btn btn-primary"
                        data-bs-toggle="modal"
                        id="aceptarNuevoCliente"
                        disabled
                    >
                        Continuar
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>