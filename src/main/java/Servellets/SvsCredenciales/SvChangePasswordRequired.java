package Servellets.SvsCredenciales;

import Logica.Acceso;
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
@WebServlet(name = "SvChangePasswordRequired", urlPatterns = {"/SvChangePasswordRequired"})
public class SvChangePasswordRequired extends HttpServlet {
    
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
        
        control = new LogicController();
        
        long idAccess = Long.parseLong((String) request.getParameter("idAccess_"));
        String password = (String) request.getParameter("password_");
                
        try {
            credencial = control.buscarAcceso(idAccess);
            credencial.setPassword(password);
            credencial.setNewOrChangePassword(false);
            control.editarAcceso(credencial);
            
            /**
             * Una vez cambiada la contraseña, se establece el atributo de sesion "idCredencial" en null
             * para producir error en NuevaClaveUsuario.jsp, si se accede por URL. 
             */
            String id = null;
            HttpSession idAccessSession = request.getSession();
            idAccessSession.setAttribute("idCredencial", id);
            
            response.sendRedirect("login.jsp?passwordChange=true");
            
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
