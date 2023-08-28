package Servellets.ServelletsEmpleados;

import Logica.Empleado;
import Logica.LogicController;
import Logica.Acceso;
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
    Acceso user = null;

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
            
            String cedula = request.getParameter("cedula_");
            String nombres = request.getParameter("nombres_");
            String apellidos = request.getParameter("apellidos_");
            String fechaNacimiento = request.getParameter("fechaNacimiento_");
            String telefono = request.getParameter("telefono_");
            String cargo = request.getParameter("cargo_");

            /* Convertir a tipo Date */
            Date nacimiento = control.getTypeDate(fechaNacimiento);

            try {
                empleado = new Empleado();

                /* Crea credenciales nulas sin acceso al sistema. */
                user = control.setCredentialsValues("-", "-", false, false);
                control.crearAcceso(user);

                empleado = control.setEmployData(cedula, nombres, apellidos, nacimiento, telefono, cargo, user);
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
