<%
    /**
     * Verfica si existe una sesion activa.
     * En caso de que no exista sesion activa, redirige a login.jsp.
     */
    String user = (String) request.getSession().getAttribute("usuario");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>