<%
    /**
     * En caso si existe una sesion activa, redirigira a la pagina principal.
     */
    String user = (String) request.getSession().getAttribute("usuario");
    if (user != null) {
        response.sendRedirect("index.jsp");
    }
%>