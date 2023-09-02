<%@page import="Logica.Empleado"%>
<%@page import="Logica.Acceso"%>
<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<nav class="text-light d-flex flex-column pb-2 z-1 gap-3">
    <div class="d-flex flex-column gap-0 nav-menu">
        <div class="d-flex flex-row gap-3 p-3">
            <p
                class="h2 m-0 d-flex flex-row gap-3 titulo-nav align-items-center"
            >
                <i
                    class="fontawesome fa-solid fa-book-open d-flex justify-content-center align-items-center"
                ></i>
                <span>Librería</span>
            </p>
        </div>
        <div class="border opacity-25"></div>
        <form action="SvMenuPrincipal" method="get">
            <button
                type="submit"
                class="btn btn-primary d-flex flex-row gap-2 align-items-center menu-principal p-3"
            >
                <i class="fa-solid fa-bars"></i>
                <span>Dashboard</span>
            </button>
        </form>
        <div class="border opacity-25"></div>
        <div class="accordion mt-3" id="acordionActions">
            
            <%
                Acceso credencial = (Acceso) request.getSession().getAttribute("credencial");
                String funcion = (String) request.getSession().getAttribute("funcion");
                
                try {
                
                    if (credencial.isAdmin()) {
            %>
            <%@include file="./navbarAccordion/accordionItemBook.jsp" %>
            <%@include file="./navbarAccordion/accordionItemSales.jsp" %>
            <%@include file="./navbarAccordion/accordionItemEmploy.jsp" %>
            <%
                    } else {
                        
                        if (funcion.equals("perchero")) {
            %>
            <%@include file="./navbarAccordion/accordionItemBook.jsp" %>
            <%
                        }

                        if (funcion.equals("cajero")) {
            %>
            <%@include file="./navbarAccordion/accordionItemSales.jsp" %>
            <%
                        }
                    }

                } catch (Exception e) {}
            %>
            
        </div>
    </div>
    
    <div class="dropdown container-fluid m-0 p-0">
        <div class="border opacity-25"></div>
        <a
            class="btn btn-primary dropdown-toggle d-flex justify-content-between align-items-center"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
            style="width: 100%; height: 50px"
        >
            <div class="d-flex align-items-center gap-3">
                <i
                    class="fa-solid fa-circle-user"
                    style="font-size: 25px"
                ></i>
                <%
                try {
                %>
                <span><%= credencial.getUserName() %></span>
                <%
                    } catch (Exception e) {}
                %>
            </div>
        </a>

        <ul class="dropdown-menu shadow p-auto" id="menu-sesion" style="width: 100%;">
            <li>
                <form class="dropdown-item" action="SvCerrarSesion" method="POST">
                    <button
                        class="d-flex justify-content-start align-items-center gap-3 m-0 p-0"
                        type="submit"
                        style="width: 100%; height: 25px; background-color: transparent; border: none;"
                    >
                        <i class="fa-solid fa-sign-out-alt"></i>
                        <span>Cerrar sesión</span>
                    </button>
                </form>
            </li>
        </ul>
    </div>
</nav>