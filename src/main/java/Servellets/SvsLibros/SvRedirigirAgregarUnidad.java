package Servellets.SvsLibros;

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

        try {
            control = new LogicController();

            try {
                long id = Long.parseLong((String) request.getParameter("idLibro_"));
                Libro libroMod = control.buscarLibro(id);

                HttpSession libroModSession = request.getSession();
                libroModSession.setAttribute("libroAModificar", libroMod);

                response.sendRedirect("aniadirCantidadLibro.jsp");

            } catch (Exception e) {
                System.out.println(e.getMessage());
                response.sendRedirect("index.jsp?accion=error");
            }
            
        } catch (Exception e) {
            response.sendRedirect("error500.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
