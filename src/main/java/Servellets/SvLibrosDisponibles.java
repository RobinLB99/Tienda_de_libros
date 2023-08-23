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
import java.util.List;


@WebServlet(name = "SvLibrosDisponibles", urlPatterns = {"/SvLibrosDisponibles"})
public class SvLibrosDisponibles extends HttpServlet {
    
    LogicController control = null;
    List<Libro> listaLibros = null;
    
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
        processRequest(request, response);
        
        try {
            
            control = new LogicController();

            try {
                listaLibros = control.listaLibros();

                HttpSession miSesionListaLibros = request.getSession();
                miSesionListaLibros.setAttribute("listaLibros", listaLibros);

                response.sendRedirect("./librosDisponibles.jsp");

            } catch (Exception e) {
                System.out.println(e.getMessage());
                response.sendRedirect("./index.jsp?accion=error");
            }

            listaLibros = null;
            
        } catch (Exception a) {
            response.sendRedirect("error500.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
