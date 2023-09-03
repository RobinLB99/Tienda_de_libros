<%@page import="Logica.Acceso"%>
<%
    String isSessionStarted = (String) request.getSession().getAttribute("SessionStarted");
    if (isSessionStarted == null) isSessionStarted = "no-started";
    
    if (isSessionStarted.equals("started")) {
        Acceso credenAccess = (Acceso) request.getSession().getAttribute("credencial");
        boolean isAdmin = false;

        if (credenAccess != null) isAdmin = credenAccess.isAdmin();
        if (credenAccess != null && !isAdmin) response.sendRedirect("AccessDenied.jsp"); 
    }
%>