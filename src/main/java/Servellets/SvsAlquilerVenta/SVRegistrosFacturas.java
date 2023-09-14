package Servellets.SvsAlquilerVenta;

import Logica.Alquiler;
import Logica.LogicController;
import Logica.Venta;
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
@WebServlet(name = "SVRegistrosFacturas", urlPatterns = {"/SVRegistrosFacturas"})
public class SVRegistrosFacturas extends HttpServlet {
    
    LogicController control = new LogicController();
    List<Alquiler> registrosAlquiler = null;
    List<Venta> registrosVenta = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tipoRegistro = (String) request.getParameter("registro_");
        
        if (tipoRegistro.equals("alquiler")) {
            registrosAlquiler = control.listaFacturasAlquiler();
            
            HttpSession facturasAlquiler = request.getSession();
            facturasAlquiler.setAttribute("registroAlquiler", registrosAlquiler);
            
            response.sendRedirect("RegistroAlquiler.jsp");
            
        } else {
            registrosVenta = control.listaFacturasVentas();

            HttpSession facturasVentas = request.getSession();
            facturasVentas.setAttribute("registroVentas", registrosVenta);
            
            response.sendRedirect("RegistroVentas.jsp");
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
