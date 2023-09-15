package Servellets.SvsAlquilerVenta;

import Logica.Alquiler;
import Logica.CantidadLibroPedido;
import Logica.Libro;
import Logica.LogicController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author joel
 */
@WebServlet(name = "SvReceptarLibrosAlquilados", urlPatterns = {"/SvReceptarLibrosAlquilados"})
public class SvReceptarLibrosAlquilados extends HttpServlet {
    
    LogicController control = new LogicController();
    Alquiler registro = null;

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
        long registroID = Long.parseLong((String) request.getParameter("id_facturaAlquiler_"));
        
        try {
            registro = control.buscarFacturaAquiler(registroID);
            List<CantidadLibroPedido> libros = registro.getLibrosPedidos();
            for (CantidadLibroPedido libroPedido : libros) {
                Libro libro = libroPedido.getLibro();
                libro.setUnidades(libro.getUnidades() + libroPedido.getCantidad());
                control.editarLibro(libro);
            };
            
            registro.setEstadoAlquiler("Devuelto");
            control.editarFacturaAlquiler(registro);
            
            response.sendRedirect("index.jsp?accion=libros_devueltos");
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.sendRedirect("error500.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
