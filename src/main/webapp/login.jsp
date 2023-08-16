<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <%@include file="./components/head.jsp" %>

    <body class="bg-gradient-primary">
        <%
            String userSession = (String) request.getSession().getAttribute("usuario");
            if (userSession != null) {
                response.sendRedirect("index.jsp");
            }
        %>
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
                                        <form class="user" action="SvLogin" method="POST">
                                            <div class="form-group login mb-4">
                                                <input
                                                    type="text"
                                                    class="form-control form-control-user"
                                                    id="inputUserName"
                                                    name="userName_"
                                                    placeholder="Ingrese su nombre de usuario..."
                                                    required
                                                />
                                            </div>
                                            <div class="form-group login mb-4">
                                                <input
                                                    type="password"
                                                    class="form-control form-control-user"
                                                    id="inputPassword"
                                                    name="password_"
                                                    placeholder="Contraseña"
                                                    required
                                                />
                                            </div>
                                            <button
                                                type="submit"
                                                class="btn login btn-primary btn-user btn-block "
                                            >
                                                Inicar sesión
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
        <script src="./assets/validarSesion.js"></script>
    </body>
</html>
