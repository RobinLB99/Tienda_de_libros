package Servellets.SvsAlquilerVenta;

import Logica.Acceso;
import Logica.Alquiler;
import Logica.CantidadLibroPedido;
import Logica.Cliente;
import Logica.Empleado;
import Logica.Libro;
import Logica.LogicController;
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
@WebServlet(name = "SvIngresarFacturaAlquiler", urlPatterns = {"/SvIngresarFacturaAlquiler"})
public class SvIngresarFacturaAlquiler extends HttpServlet {

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
            double totalFactura = Double.parseDouble((String) request.getParameter("totalFactura_"));
            Empleado empleado = control.getEmployByUserName((String) credencial.getUserName());

            List<Libro> libros = new ArrayList();
            Alquiler facALquiler = new Alquiler();
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

            facALquiler.setNumFactura(numFactura);
            facALquiler.setCliente(cliente);
            facALquiler.setValorFactura(totalFactura);
            facALquiler.setEmpleado(empleado);
            facALquiler.setEstadoAlquiler("Activo");
            facALquiler.setLibrosPedidos(listPedido);

            control.crearFacturaALquiler(facALquiler);

            for (Libro libro : libros) {
                control.editarLibro(libro);
            }

            response.sendRedirect("index.jsp?accion=alquilado");

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
