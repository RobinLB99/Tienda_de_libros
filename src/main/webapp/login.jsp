<!DOCTYPE html>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@include file="./components/head.jsp" %>
    </head>

    <body class="bg-gradient-primary">
        <%@include file="./components/isOpenedSession.jsp" %>
        <div class="container">
            <!-- Outer Row -->
            <div class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div
                                    class="col-lg-6 d-none d-lg-block bg-login-image"
                                ></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">
                                                ¡Bienvenido!
                                            </h1>
                                        </div>
                                        <form class="user" action="SvLogin" method="post">
                                            <div class="form-group login mb-4">
                                                <input
                                                    type="text"
                                                    class="form-control form-control-user"
                                                    name="userName_"
                                                    id="exampleInputEmail"
                                                    placeholder="Ingrese su nombre de usuario..."
                                                    required
                                                />
                                            </div>
                                            <div class="form-group login mb-4">
                                                <input
                                                    type="password"
                                                    class="form-control form-control-user"
                                                    name="password_"
                                                    id="exampleInputPassword"
                                                    placeholder="Contraseña"
                                                    required
                                                />
                                            </div>
                                            <button
                                                type="submit"
                                                class="btn login btn-primary btn-user btn-block "
                                            >
                                                Iniciar sesión
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Modal usuarios y contraseña incorrectos -->
        <div
            class="modal fade"
            id="AccessValuesIncorrect"
            data-bs-backdrop="static"
            data-bs-keyboard="false"
            tabindex="-1"
            aria-labelledby="staticBackdropLabel"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 text-danger" id="staticBackdropLabel">
                            ¡Error de acceso!
                        </h1>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <p>EL nombre de usuario y/o contraseña es incorrecto.
                            <br>Por favor, ingresa el usuario y contraseña correctamente.</p>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-primary"
                            data-bs-dismiss="modal"
                        >
                            Continuar
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal cambio de clave requerido exitoso -->
        <div
            class="modal fade"
            id="PasswordRequiredChange"
            data-bs-backdrop="static"
            data-bs-keyboard="false"
            tabindex="-1"
            aria-labelledby="staticBackdropLabel"
            aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 text-success" id="staticBackdropLabel">
                            ¡Cambio de clave requerido exitoso!
                        </h1>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <p>La contraseña se cambio correctamente.<br>Por favor, ingrese su usuario y nueva contraseña.</p>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-primary"
                            data-bs-dismiss="modal"
                        >
                            Continuar
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
