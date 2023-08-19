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
    
    LogicController control = new LogicController();
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
        
        listaLibros = control.listaLibros();

        HttpSession miSesionListaLibros = request.getSession();
        miSesionListaLibros.setAttribute("listaLibros", listaLibros);

        response.sendRedirect("./librosDisponibles.jsp");

        listaLibros = null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
