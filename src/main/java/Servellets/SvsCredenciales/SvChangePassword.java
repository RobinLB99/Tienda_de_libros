package Servellets.SvsCredenciales;

import Logica.Acceso;
import Logica.LogicController;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author joel
 */
@WebServlet(name = "SvChangePassword", urlPatterns = {"/SvChangePassword"})
public class SvChangePassword extends HttpServlet {

    LogicController control = null;
    Acceso credencial = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long id = Long.parseLong((String) request.getParameter("id_"));
        String password = (String) request.getParameter("password_");

        try {
            control = new LogicController();

            credencial = control.buscarAcceso(id);
            credencial.setPassword(password);
            credencial.setNewOrChangePassword(true);

            control.editarAcceso(credencial);

            String actionString = "password";
            HttpSession accion = request.getSession();
            accion.setAttribute("accion", actionString);

            control.redirectToServellet(request, response, "/SvRedirigirGestionEmpleados");

        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.sendRedirect("error500.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
