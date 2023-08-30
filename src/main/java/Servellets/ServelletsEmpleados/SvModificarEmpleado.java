package Servellets.ServelletsEmpleados;

import Logica.Acceso;
import Logica.Empleado;
import Logica.LogicController;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 *
 * @author joel
 */
@WebServlet(name = "SvModificarEmpleado", urlPatterns = {"/SvModificarEmpleado"})
public class SvModificarEmpleado extends HttpServlet {
    
    LogicController control = null;
    Empleado empleado = null;

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
        
        try {
            control = new LogicController();

            long id = Long.parseLong((String) request.getParameter("id_"));
            String cedula = (String) request.getParameter("cedula_");
            String nombres = (String) request.getParameter("nombres_");
            String apellidos = (String) request.getParameter("apellidos_");
            String fNacimiento = (String) request.getParameter("fechaNacimiento_");
            String telefono = (String) request.getParameter("telefono_");
            String cargo = (String) request.getParameter("cargo_");

            Date nacimiento = control.getTypeDate(fNacimiento);
            
            empleado = control.buscarEmpleado(id);
            empleado.setCedula(cedula);
            empleado.setNombre(nombres);
            empleado.setApellidos(apellidos);
            empleado.setFechaNacimiento(nacimiento);
            empleado.setTelefono(telefono);
            empleado.setFuncion(cargo);
            
            control.editarEmpleado(empleado);
            
            response.sendRedirect("index.jsp?accion=empleado_modificado");
            
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
