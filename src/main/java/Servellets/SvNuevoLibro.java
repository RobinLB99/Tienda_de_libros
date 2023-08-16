package Servellets;

import Logica.Libro;
//import Logica.LogicController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author ROBINLB99
 */
@WebServlet(name = "SvAgregarLibro", urlPatterns = {"/SvAgregarLibro"})
public class SvNuevoLibro extends HttpServlet {
    
//    LogicController control = new LogicController();

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
        
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombreLibro");
        String autor = request.getParameter("autor");
        String anio = request.getParameter("anioPublicacion");
        Double precio = Double.parseDouble(request.getParameter("precio"));
        
        Libro libro = new Libro();
        libro.setCodigo(codigo);
        libro.setNombre(nombre);
        libro.setAutor(autor);
        libro.setAnio(anio);
        libro.setPrecio(precio);
        
//        control.agregarLibro(libro);
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
