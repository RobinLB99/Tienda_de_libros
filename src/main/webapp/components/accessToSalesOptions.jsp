<%@page import="Logica.Acceso"%>
<%
    String isSessionStarted = (String) request.getSession().getAttribute("SessionStarted");
    if (isSessionStarted == null) isSessionStarted = "no-started";
    
    if (isSessionStarted.equals("started")) {
        String funcionCargo = (String) request.getSession().getAttribute("funcion");
        if (funcionCargo == null) funcionCargo = "";

        if (!funcionCargo.equals("admin") && !funcionCargo.equals("cajero"))
            response.sendRedirect("AccessDenied.jsp");
    }
%>