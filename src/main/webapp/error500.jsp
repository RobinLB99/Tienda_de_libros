<!DOCTYPE html>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@include file="./components/head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <!-- 500 Error Text -->
            <form class="text-center" action="SvMenuPrincipal" method="get">
                <div class="error mx-auto" style="font-size: 70px">500</div>
                <p class="lead text-gray-800 mb-5">
                    Base de datos fuera de linea
                </p>
                <p class="text-gray-500 mb-0">
                    La base de datos no se encuentra disponible en este momento.
                    ¡Por favor intente mas tarde!
                </p>
                <button
                    style="background-color: transparent; border: none"
                    type="submit"
                >
                    &larr; <span class="link-primary">Volver a la pagina principal</span>
                </button>
            </form>
        </div>
    </body>
</html>
