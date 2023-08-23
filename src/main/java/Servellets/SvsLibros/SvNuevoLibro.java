package Servellets;

import Logica.Libro;
import Logica.LogicController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author ROBINLB99
 */
@WebServlet(name = "SvNuevoLibro", urlPatterns = {"/SvNuevoLibro"})
public class SvNuevoLibro extends HttpServlet {

    LogicController control = null;

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

            try {
                String codigo = (String) request.getParameter("codigo_");
                String nombre = (String) request.getParameter("nombreLibro_");
                String autor = (String) request.getParameter("autor_");
                String anio = (String) request.getParameter("anioPublicacion_");
                double precio = Double.parseDouble((String) request.getParameter("precio_"));
                int unidades = Integer.parseInt((String) request.getParameter("unidades_"));

                Libro libro = new Libro();
                libro.setCodigo(codigo);
                libro.setNombre(nombre);
                libro.setAutor(autor);
                libro.setAnio(anio);
                libro.setPrecio(precio);
                libro.setUnidades(unidades);

                control.crearLibro(libro);

                response.sendRedirect("index.jsp?accion=nuevo_libro_ingresado");

            } catch (Exception e) {
                System.out.println(e.getMessage());
                response.sendRedirect("index.jsp?accion=error");
            }
            
        } catch (Exception a) {
            response.sendRedirect("error500.jsp");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
