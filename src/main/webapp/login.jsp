<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="./components/head.jsp" %>
    </head>

    <body class="bg-gradient-primary">
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
                                                �Bienvenido!
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
                                                />
                                            </div>
                                            <div class="form-group login mb-4">
                                                <input
                                                    type="password"
                                                    class="form-control form-control-user"
                                                    name="password_"
                                                    id="exampleInputPassword"
                                                    placeholder="Contrase�a"
                                                />
                                            </div>
                                            <button
                                                type="submit"
                                                class="btn login btn-primary btn-user btn-block "
                                            >
                                                Inicar sesi�n
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
