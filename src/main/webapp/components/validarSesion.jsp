<%
    String user = (String) request.getSession().getAttribute("usuario");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>