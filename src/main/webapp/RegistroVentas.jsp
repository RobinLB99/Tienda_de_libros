<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="./components/head.jsp" %>
    </head>
    <body>
        <%@include file="./components/validarSesion.jsp" %>
        <%@include file="./components/accessToSalesOptions.jsp" %>
        <%@include file="./components/navbar.jsp" %>
        <div class="contenedor-principal bg-body-tertiary">
            <header
                class="p-3 m-0 shadow d-flex flex-row align-items-center justify-content-between"
                >
                <p class="h5 m-0">Software de gestión de librería</p>
            </header>
            <main class="p-3 m-0">
                <div class="contenedor-contenido container-fluid p-0">
                    <%
                        try {
                    %>
                    <%@include file="./components/registrosFacturasVenta.jsp" %>
                    <%
                        } catch (Exception e) {
                        }
                    %>
                </div>
            </main>
            <%@include file="./components/footer.jsp" %>
        </div>
    </body>
</html>
