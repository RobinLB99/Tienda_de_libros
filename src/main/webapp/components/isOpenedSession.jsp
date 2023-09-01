<%@page import="Logica.Acceso"%>
<%
    /**
     * En caso si existe una sesion activa, redirigira a la pagina principal.
     */
    Acceso cAccess = (Acceso) request.getSession().getAttribute("credencial");
    if (cAccess != null) {
        response.sendRedirect("index.jsp");
    }
%>