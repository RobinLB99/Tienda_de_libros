<!DOCTYPE html>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@include file="./components/head.jsp" %>
    </head>

    <body class="bg-gradient-primary">
        <%
            /**
            * Verifica antes si exite el atributo idCredencial en la sesion activa creado por SvLogin con el valor del
                id de la credencial que requiere cambio de clave.
            */
            String id;
            try { id = String.valueOf((long) request.getSession().getAttribute("idCredencial"));
            } catch (Exception ex) { id = null;}
            
            /**
             * En caso de que que se detecte un error (por tipo de dato), el valor id se vuelve null.
             */ 
            
            if (id == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        
        <div class="container">
            <!-- Outer Row -->
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div
                        class="card border-0 shadow-lg my-5 mx-auto"
                        style="max-width: 700px; width: 100%"
                    >
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">
                                                ¡Cambio de contraseña requerido!
                                            </h1>
                                        </div>
                                        <div class="mensaje text-center mb-3">
                                            <span
                                                class="text-secondary"
                                                style="font-size: 14px"
                                                >Las credenciales de acceso son
                                                nuevas o se ha recuperado la
                                                contraseña, por lo tanto, es
                                                necesario ingresar una nueva
                                                contraseña antes de
                                                continuar.</span
                                            >
                                        </div>
                                        <div
                                            class="border opacity-25 mb-3"
                                        ></div>
                                        <form
                                            class="user changePassword d-flex flex-column"
                                            action="SvChangePasswordRequired"
                                            method="POST"
                                        >
                                            <input
                                                type="text"
                                                name="idAccess_"
                                                value="<%= id %>"
                                                required
                                                hidden
                                            />
                                            <label class="mb-3">
                                                <input
                                                    type="password"
                                                    class="form-control form-control-user"
                                                    name="password_"
                                                    id="password"
                                                    placeholder="Ingrese su nueva contraseña..."
                                                    required
                                                />
                                                <span id="spanPassword" class="text-secondary"
                                                    >* No espacios. Mínimo 10 caracteres.</span
                                                >
                                            </label>
                                            <label class="mb-3">
                                                <input
                                                    type="password"
                                                    class="form-control form-control-user"
                                                    name="repeat_password_"
                                                    id="repeat_password"
                                                    placeholder="Repita la contraseña anterior"
                                                    required
                                                />
                                            </label>
                                            <div
                                                class="border opacity-25 mb-3"
                                            ></div>
                                            <div class="controles d-flex gap-3">
                                                <button
                                                    type="button"
                                                    class="btn btn-primary btn-user btn-block"
                                                    id="verificarPassword"                                                    
                                                >
                                                    Verificar
                                                </button>
                                                <button
                                                    type="submit"
                                                    class="btn btn-primary btn-user btn-block"
                                                    id="btnSendPassword"
                                                    disabled
                                                >
                                                    Cambiar contraseña
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div
            class="modal fade"
            id="changePasswordModal"
            data-bs-backdrop="static"
            data-bs-keyboard="false"
            tabindex="-1"
            aria-labelledby="title-alert"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="title-modal"></h1>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                            id="close-modal-1"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <span class="m-0 text-secondary" id="message_"></span>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-primary"
                            data-bs-dismiss="modal"
                            id="close-modal-2"
                        >
                            Continuar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>


