package Servellets.ServelletsEmpleados;

import Logica.Empleado;
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
@WebServlet(name = "SvEliminarEmpleado", urlPatterns = {"/SvEliminarEmpleado"})
public class SvEliminarEmpleado extends HttpServlet {

    Empleado empleado = null;
    LogicController control = null;

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

            long idEmpleado = Long.parseLong((String) request.getParameter("id_empleado"));
            long idUsuario = Long.parseLong((String) request.getParameter("id_credentials"));

            control.eliminarEmpleado(idEmpleado);
            control.eliminarAcceso(idUsuario);

            response.sendRedirect("index.jsp?accion=empleado_eliminado");

        } catch (Exception e) {
            response.sendRedirect("index.jsp?accion=error");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
