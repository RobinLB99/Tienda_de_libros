package Servellets.SvsAlquilerVenta;

import Logica.Libro;
import Logica.LogicController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author joel
 */
@WebServlet(name = "SvListaLibrosSeleccionar", urlPatterns = {"/SvListaLibrosSeleccionar"})
public class SvListaLibrosSeleccionar extends HttpServlet {
    
    LogicController control = null;
    List<Libro> listaLibrosToSelect = null;

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
        try {
            control = new LogicController();
            listaLibrosToSelect = control.listaLibros();
            
            HttpSession listaLibrosSelect = request.getSession();
            listaLibrosSelect.setAttribute("listaLibrosSelect", listaLibrosToSelect);
            
            response.sendRedirect("SeleccionarLibro.jsp");
            
        } catch (Exception e) {
            response.sendRedirect("error500.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
