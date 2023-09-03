package Servellets.ServelletsEmpleados;

import Logica.Empleado;
import Logica.LogicController;
import java.io.IOException;
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
@WebServlet(name = "SvRedirigirModificarEmpleado", urlPatterns = {"/SvRedirigirModificarEmpleado"})
public class SvRedirigirModificarEmpleado extends HttpServlet {

    LogicController control = null;
    Empleado empleado = null;

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

        control = new LogicController();

        try {
            long idEmploy = Long.parseLong((String) request.getParameter("id_usuario_empleado"));

            empleado = control.buscarEmpleado(idEmploy);
            
            HttpSession employToMod = request.getSession();
            employToMod.setAttribute("employToMod", empleado);
            
            response.sendRedirect("ModificarEmpleado.jsp");
            
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
