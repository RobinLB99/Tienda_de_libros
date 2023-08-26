package Servellets.ServelletsEmpleados;

import Logica.ConvertirFecha;
import Logica.Empleado;
import Logica.LogicController;
import Logica.Usuario;
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
@WebServlet(name = "SvCrearEmpleado", urlPatterns = {"/SvCrearEmpleado"})
public class SvCrearEmpleado extends HttpServlet {
    
    LogicController control = null;
    Empleado empleado = null;
    Usuario user = null;

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
            String cedula = request.getParameter("cedula_");
            String nombres = request.getParameter("nombres_");
            String apellidos = request.getParameter("apellidos_");
            String nacimiento = request.getParameter("fechaNacimiento_");
            String telefono = request.getParameter("telefono_");
            String cargo = request.getParameter("cargo_");

            /* Convertir a tipo Date */
            ConvertirFecha convert = new ConvertirFecha(nacimiento);
            Date fechaNacimiento = convert.getDate();
            
            try {
                control = new LogicController();
                empleado = new Empleado();
                
                /* Crea al empleado credenciales vacias sin acceso al sistema. */
                user = new Usuario();
                user.setUserName("-");
                user.setPassword("-");
                user.setAdmin(false);
                control.crearUsuario(user);
                /**/
                
                empleado.setCedula(cedula);
                empleado.setNombre(nombres);
                empleado.setApellidos(apellidos);
                empleado.setFechaNacimiento(fechaNacimiento);
                empleado.setTelefono(telefono);
                empleado.setFuncion(cargo);
                empleado.setUsuario(user);
                
                control.crearEmpleado(empleado);
                
                response.sendRedirect("index.jsp?accion=empleado_ingresado");
                
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                response.sendRedirect("index.jsp?accion=error");
            }
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.sendRedirect("aniadirEmpleado.jsp?error=true");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
