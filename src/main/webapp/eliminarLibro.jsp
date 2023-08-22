<!DOCTYPE html>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@include file="./components/head.jsp" %>
    </head>
    <body>
        <%@include file="./components/navbar.jsp" %>
        <div class="contenedor-principal bg-body-tertiary">
            <header
                class="p-3 m-0 shadow d-flex flex-row align-items-center justify-content-between"
            >
                <p class="h5 m-0">Software de gestión de libreria</p>
            </header>
            <main class="p-3 m-0">
                <div class="contenedor-contenido container-fluid p-0">
                    <%
                        try {
                    %>
                    <%@include file="./components/targetaEliminarLibro.jsp" %>
                    <%
                        } catch (Exception e) {
                            System.out.println(e.getMessage());
                        }
                    %>
                </div>
            </main>
            <%@include file="./components/footer.jsp" %>
        </div>
    </body>
</html>