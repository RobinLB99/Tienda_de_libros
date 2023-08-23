package Servellets;

import Logica.Libro;
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
@WebServlet(name = "SvAgregarUnidadesLibro", urlPatterns = {"/SvAgregarUnidadesLibro"})
public class SvAgregarUnidadesLibro extends HttpServlet {
    
    LogicController control = new LogicController();

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
        
        long idLibro = Long.parseLong((String) request.getParameter("agregar_"));
        int unidadesAgregar = Integer.parseInt((String) request.getParameter("masUnidades_"));
        
        try {
            Libro book_m = control.buscarLibro(idLibro);
            
            int unidadesDisponibles = book_m.getUnidades();
            book_m.setUnidades(unidadesDisponibles + unidadesAgregar);
            
            control.editarLibro(book_m);

            response.sendRedirect("index.jsp?accion=unidades_agregadas");
            
        } catch (Exception e) {
            response.sendRedirect("index.jsp?accion=error");
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
