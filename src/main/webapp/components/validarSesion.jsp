<%@page import="Logica.Acceso"%>
<%
    /**
     * Verfica si existe una sesion activa.
     * En caso de que no exista sesion activa, redirige a login.jsp.
     */
    Acceso cAccess = (Acceso) request.getSession().getAttribute("credencial");
    if (cAccess == null) {
        response.sendRedirect("login.jsp");
    }
%>