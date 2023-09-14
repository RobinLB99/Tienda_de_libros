package Servellets.SvsAlquilerVenta;

import Logica.Acceso;
import Logica.CantidadLibroPedido;
import Logica.Cliente;
import Logica.Empleado;
import Logica.Libro;
import Logica.LogicController;
import Logica.Venta;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author joel
 */
@WebServlet(name = "SvIngresarFacturaVenta", urlPatterns = {"/SvIngresarFacturaVenta"})
public class SvIngresarFacturaVenta extends HttpServlet {

    LogicController control = new LogicController();

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

        Cliente cliente = (Cliente) request.getSession().getAttribute("dataCliente");
        List<CantidadLibroPedido> librosPedidos = (List<CantidadLibroPedido>) request.getSession().getAttribute("listaCantidadLibrosPedidos");
        String numFactura = (String) request.getSession().getAttribute("numFactura");

        Acceso credencial = (Acceso) request.getSession().getAttribute("credencial");

        try {
            double valorFactura = Double.parseDouble((String) request.getParameter("valorFactura_"));
            Empleado empleado = control.getEmployByUserName((String) credencial.getUserName());

            List<Libro> libros = new ArrayList(); 
            Venta facVenta = new Venta();
            List<CantidadLibroPedido> listPedido = new ArrayList();

            for (CantidadLibroPedido pedido : librosPedidos) {
                control.crearCantidadLibro(pedido);
                listPedido.add(pedido);
                
                Libro libro = pedido.getLibro();
                
                libro.setUnidades(libro.getUnidades() - pedido.getCantidad());
                libros.add(libro);
            }

            if (cliente.getId() == 0) {
                control.crearCliente(cliente);
            }

            facVenta.setNumFactura(numFactura);
            facVenta.setCliente(cliente);
            facVenta.setValorFactura(valorFactura);
            facVenta.setEmpleado(empleado);
            facVenta.setLibrosPedidos(listPedido);

            control.crearFacturaVenta(facVenta);
            
            for (Libro libro : libros) {
                control.editarLibro(libro);
            }

            response.sendRedirect("index.jsp?accion=vendido");

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
