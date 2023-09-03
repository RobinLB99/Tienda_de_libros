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
@WebServlet(name = "SvChangePrivileges", urlPatterns = {"/SvChangePrivileges"})
public class SvChangePrivileges extends HttpServlet {
    
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
        String permiso = (String) request.getParameter("permisos_");
        
        boolean isAdmin = false; 
        
        try {
            control = new LogicController();
            
            credencial = control.buscarAcceso(id);
            
            if (permiso.equals("admin")) {
                isAdmin = true;
            }
           
            credencial.setAdmin(isAdmin);
            
            control.editarAcceso(credencial);
            
            control.setActionSessionAttribute(request, "privilegios");
            
            try {
                control.redirectToServellet(request, response, "/SvRedirigirGestionEmpleados");
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                response.sendError(400);
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
