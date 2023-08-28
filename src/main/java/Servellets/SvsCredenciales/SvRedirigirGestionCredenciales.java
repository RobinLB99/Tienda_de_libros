package Servellets.SvsCredenciales;

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
@WebServlet(name = "SvRedirigirGestionCredenciales", urlPatterns = {"/SvRedirigirGestionCredenciales"})
public class SvRedirigirGestionCredenciales extends HttpServlet {
    
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
        
        long idEmpleado = Long.parseLong((String) request.getParameter("id_usuario_empleado"));
        
        try {
            control = new LogicController();
            empleado = control.buscarEmpleado(idEmpleado);
            
            HttpSession employ = request.getSession();
            employ.setAttribute("empleado", empleado);
            
            response.sendRedirect("GestionCredenciales.jsp");
            
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
