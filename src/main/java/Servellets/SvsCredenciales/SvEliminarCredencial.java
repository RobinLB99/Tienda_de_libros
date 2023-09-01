package Servellets.SvsCredenciales;

import Logica.Acceso;
import Logica.LogicController;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
            
            String actionString = "eliminar";
            HttpSession accion = request.getSession();
            accion.setAttribute("accion", actionString);
            
            // Redirige a otro Servellet mediante la encapsulacion de la solicitud y seteo de atributo.
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/SvRedirigirGestionEmpleados");
            HttpServletRequestWrapper wrapper = new HttpServletRequestWrapper(request);
            wrapper.setAttribute("method", "doPost");
            dispatcher.forward(wrapper, response);
            
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
