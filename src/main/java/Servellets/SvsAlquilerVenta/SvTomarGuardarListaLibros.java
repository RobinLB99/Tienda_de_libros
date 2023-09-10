package Servellets.SvsAlquilerVenta;

import Logica.Cliente;
import Logica.LogicController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joel
 */
@WebServlet(name = "SvTomarGuardarListaLibros", urlPatterns = {"/SvTomarGuardarListaLibros"})
public class SvTomarGuardarListaLibros extends HttpServlet {
    
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
        String stringJSON = (String) request.getParameter("arrayObjetos_");
        
        HttpSession JSON = request.getSession();
        JSON.setAttribute("librosSeleccionados", stringJSON);

        try {
            control = new LogicController();
            List<Cliente> clientes = control.listaClientes();
            
            HttpSession listaCLientes = request.getSession();
            listaCLientes.setAttribute("listaCLientes", clientes);
            
            response.sendRedirect("DatosTransaccion.jsp");
            
        } catch (Exception e) {
            response.sendRedirect("error500.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
