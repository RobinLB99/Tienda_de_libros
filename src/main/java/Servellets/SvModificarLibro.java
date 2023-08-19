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
@WebServlet(name = "SvModificarLibro", urlPatterns = {"/SvModificarLibro"})
public class SvModificarLibro extends HttpServlet {
    
    LogicController control= null;
    
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
        
        control = new LogicController();

        try {
            long id = Long.parseLong((String) request.getParameter("id_"));
            String codigo = request.getParameter("codigo_");
            String nombre = request.getParameter("nombre_");
            String autor = request.getParameter("autor_");
            String anio = request.getParameter("anio_");
            double precio = Double.parseDouble((String) request.getParameter("precio_"));
            int unidades = Integer.parseInt((String) request.getParameter("unidades_"));
            
            try {
                Libro libro = control.buscarLibro(id);
                
                libro.setCodigo(codigo);
                libro.setNombre(nombre);
                libro.setAutor(autor);
                libro.setAnio(anio);
                libro.setPrecio(precio);
                libro.setUnidades(unidades);
                
                control.editarLibro(libro);
                
                response.sendRedirect("index.jsp?accion=libro_modificado");

            } catch (Exception e) {
                System.out.println(e.getMessage());
                response.sendRedirect("index.jsp?accion=error");
            }
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
