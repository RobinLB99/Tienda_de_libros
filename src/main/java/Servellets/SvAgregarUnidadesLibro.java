package Servellets;

import Logica.Libro;
import Logica.LogicController;
import java.io.IOException;
import java.io.PrintWriter;
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
        
        long idLibro = Integer.parseInt((String) request.getParameter("idLibro_"));
        int unidadesAgregar = Integer.parseInt((String) request.getParameter("unidadesAgregar_"));
        
        try {
            Libro book = control.buscarLibro(idLibro);
            book.setUnidades(book.getUnidades() + unidadesAgregar);
            control.editarLibro(book);

            response.sendRedirect("index.jsp?unidades_agregadas=true");
        } catch (Exception e) {
            response.sendRedirect("index.jsp?unidades_agregadas=false");
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
