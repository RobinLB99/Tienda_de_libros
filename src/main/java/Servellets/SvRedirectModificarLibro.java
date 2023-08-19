package Servellets;

import Logica.Libro;
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
@WebServlet(name = "SvRedirectModificarLibro", urlPatterns = {"/SvRedirectModificarLibro"})
public class SvRedirectModificarLibro extends HttpServlet {
    
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
        
        control = new LogicController();
        long id_libro_mod = Long.parseLong(request.getParameter("modificar_"));
        
        try {
            Libro libroMod = control.buscarLibro(id_libro_mod);
            
            HttpSession mySessionIdBookMod = request.getSession();
            mySessionIdBookMod.setAttribute("libro_", libroMod);

            response.sendRedirect("modificarLibro.jsp");
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.sendRedirect("index.jsp?accion=error");
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
