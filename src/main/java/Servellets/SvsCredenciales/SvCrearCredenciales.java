package Servellets.SvsCredenciales;

import Logica.LogicController;
import Logica.Acceso;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author joel
 */
@WebServlet(name = "SvCrearCredenciales", urlPatterns = {"/SvCrearCredenciales"})
public class SvCrearCredenciales extends HttpServlet {

    LogicController control = null;
    Acceso credencial = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        try {
            control = new LogicController();

            String userName = (String) request.getParameter("nameUser_");
            String password = (String) request.getParameter("password_");
            String typeAccess = (String) request.getParameter("typeAccess_");

            boolean isAdmin = false;
            
            if (typeAccess.equals("1")) {
                isAdmin = true;
            }

            long idCredencial = Long.parseLong((String) request.getParameter("userId_"));
            credencial = control.buscarAcceso(idCredencial);

            try {

                Acceso cAccess = control
                        .modCredentialsValues(credencial, userName, password, isAdmin, true);
                control.editarAcceso(cAccess);

                response.sendRedirect("index.jsp?accion=credenciales_creadas");

            } catch (Exception ex) {
                response.sendRedirect("index.jsp?accion=error");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.sendRedirect("erro500.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
