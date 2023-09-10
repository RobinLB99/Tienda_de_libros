package Servellets.SvsAlquilerVenta;

import Logica.CantidadLibroPedido;
import Logica.Cliente;
import Logica.Libro;
import Logica.LogicController;
import org.json.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.json.JSONException;

/**
 *
 * @author joel
 */
@WebServlet(name = "SvTomarDatosFacturacion", urlPatterns = {"/SvTomarDatosFacturacion"})
public class SvTomarDatosFacturacion extends HttpServlet {

    LogicController control = null;
    Cliente cliente = new Cliente();
    Libro book = null;
    CantidadLibroPedido nLibroPedido = null;
    JSONObject json = null;
    ObjectMapper objectMapper = new ObjectMapper();
    long id;

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
        control = new LogicController();
        
        String tipoCliente = request.getParameter("typeOfClient_");
        String idCliente = request.getParameter("idCliente_");
        String datosNuevoCliente = request.getParameter("datosNuevoCliente_");
        String tipoFactura = request.getParameter("typeFacture_");
        
        if (tipoCliente.equals("0")) {
            /**Codigo para llenar datos vacios para consumidor final*/
            cliente.setCedula("-");
            cliente.setNombre("-");
            cliente.setApellidos("-");
            cliente.setFechaNacimiento(new Date());
            cliente.setTelefono("-");
            cliente.setDireccion("-");

        } else {
            if (!idCliente.isEmpty()) {
                /**Crear codigo para tomar el cliente de la base de datos*/
                try {
                    id = Long.parseLong(idCliente);
                    cliente = control.buscarCliente(id);

                } catch (Exception e) {
                    response.sendRedirect("error500.jsp");
                }
            } else {
                try {
                    json = new JSONObject(datosNuevoCliente);

                    cliente.setCedula((String) json.get("cedula"));
                    cliente.setNombre((String) json.get("nombres"));
                    cliente.setApellidos((String) json.get("apellidos"));
                    cliente.setFechaNacimiento(new Date());
                    cliente.setTelefono((String) json.get("telefono"));
                    cliente.setDireccion((String) json.get("direccion"));

                } catch (JSONException ex) {
                    System.out.println(ex.getMessage());
                }
            }
        }

        String librosUnidades = (String) request.getSession().getAttribute("librosSeleccionados");
        /* Convierte el string en un array de objetos */
        Object[] arrayBooksSelected = objectMapper.readValue(librosUnidades, Object[].class);

        List<CantidadLibroPedido> listaCantidadLibrosPedidos = new ArrayList<CantidadLibroPedido>();

        for (Object dataLibro : arrayBooksSelected) {
            Map<String, Object> dataBookMap = (Map<String, Object>) dataLibro;
            long idLibro = Long.parseLong(String.valueOf(dataBookMap.get("id")));
            int cantidad = Integer.parseInt(String.valueOf(dataBookMap.get("unidades")));

            try {
                book = control.buscarLibro(idLibro);

                nLibroPedido = new CantidadLibroPedido();
                nLibroPedido.setLibro(book);
                nLibroPedido.setCantidad(cantidad);

                listaCantidadLibrosPedidos.add(nLibroPedido);

            } catch (Exception e) {
                System.out.println(e.getMessage());
                response.sendRedirect("error500.jsp");
            }

        }
        
        String numInvoice = control.getNumberInvoice(new Date());

        HttpSession dataFactura = request.getSession();
        dataFactura.setAttribute("typeOfClient", tipoCliente);
        dataFactura.setAttribute("dataCliente", cliente);
        dataFactura.setAttribute("listaCantidadLibrosPedidos", listaCantidadLibrosPedidos);
        dataFactura.setAttribute("numFactura", numInvoice);
        dataFactura.setAttribute("tipoFactura", tipoFactura);
        
        System.out.println(cliente.toString());
        System.out.println(tipoFactura);
        
        if (tipoFactura.equals("0"))
            response.sendRedirect("FacturacionVenta.jsp");
        
        else response.sendRedirect("FacturacionAlquiler.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
