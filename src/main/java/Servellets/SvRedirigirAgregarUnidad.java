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

@WebServlet(name = "SvRedirigirAgregarUnidad", urlPatterns = {"/SvRedirigirAgregarUnidad"})
public class SvRedirigirAgregarUnidad extends HttpServlet {

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
        
        control = new LogicController();
        
        long id = Long.parseLong(request.getParameter("agregar_"));
        Libro libroMod = control.buscarLibro(id);
        
        HttpSession libroModSession = request.getSession();
        libroModSession.setAttribute("libroAModificar", libroMod);
        
        response.sendRedirect("aniadirCantidadLibro.jsp");
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
