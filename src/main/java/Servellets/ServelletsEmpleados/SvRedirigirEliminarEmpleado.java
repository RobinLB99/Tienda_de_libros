package Servellets.ServelletsEmpleados;

import Logica.Empleado;
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
@WebServlet(name = "SvRedirigirEliminarEmpleado", urlPatterns = {"/SvRedirigirEliminarEmpleado"})
public class SvRedirigirEliminarEmpleado extends HttpServlet {
    
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
        
        try {
            control = new LogicController();
            
            long idEmpleado = Long.parseLong((String) request.getParameter("id_usuario_empleado"));
            empleado = control.buscarEmpleado(idEmpleado);
            
            HttpSession sessionEE = request.getSession();
            sessionEE.setAttribute("empleadoEliminar", empleado);

            response.sendRedirect("EliminarEmpleado.jsp");
            
        } catch (Exception e) {
            response.sendRedirect("error500.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
