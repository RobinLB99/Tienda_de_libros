package Servellets.SvsCredenciales;

import Logica.Acceso;
import Logica.LogicController;
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
@WebServlet(name = "SvEliminarCredencial", urlPatterns = {"/SvEliminarCredencial"})
public class SvEliminarCredencial extends HttpServlet {

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

        long id = Long.parseLong((String) request.getParameter("id_"));

        try {
            control = new LogicController();

            credencial = control.buscarAcceso(id);
            credencial.setUserName("-");
            credencial.setPassword("-");
            credencial.setAdmin(false);
            control.editarAcceso(credencial);

            control.setActionSessionAttribute(request, "eliminar");

            try {
                // Redirige a otro Servellet mediante la encapsulacion de la solicitud y seteo de atributo.
                control.redirectToServellet(request, response, "/SvRedirigirGestionEmpleados");

            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                response.sendError(404);
            }

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
