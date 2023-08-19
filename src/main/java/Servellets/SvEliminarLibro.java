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
@WebServlet(name = "SvEliminarLibro", urlPatterns = {"/SvEliminarLibro"})
public class SvEliminarLibro extends HttpServlet {

    LogicController control = new LogicController();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        long id_libro = Long.parseLong(request.getParameter("eliminar_"));
        Libro libro = control.buscarLibro(id_libro);
        
        HttpSession sessionIdLibroEliminar = request.getSession();
        sessionIdLibroEliminar.setAttribute("libroEliminar", libro);
        
        response.sendRedirect("eliminarLibro.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        long idLibro_eliminar = Long.parseLong(request.getParameter("id_book_delete"));
        
        try {
            control.eliminarLibro(idLibro_eliminar);
            response.sendRedirect("index.jsp?accion=libro_eliminado");
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
