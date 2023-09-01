package Servellets.ServelletsEmpleados;

import Logica.Empleado;
import Logica.LogicController;
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
@WebServlet(name = "SvRedirigirGestionEmpleados", urlPatterns = {"/SvRedirigirGestionEmpleados"})
public class SvRedirigirGestionEmpleados extends HttpServlet {

    LogicController control = null;
    List<Empleado> listaEmpleados = null;

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

        String actionString = (String) request.getSession().getAttribute("accion");

        try {
            control = new LogicController();
            listaEmpleados = control.listaEmpleados();

            HttpSession empleados = null;
            empleados = request.getSession();
            empleados.setAttribute("listaEmpleados", listaEmpleados);

            if (actionString != null) {
                HttpSession accion = request.getSession();
                accion.setAttribute("accion", null);

                if (actionString.equals("eliminar")) {
                    response.sendRedirect("GestionarEmpleados.jsp?accion=credencial_eliminada");
                }

                if (actionString.equals("password")) {
                    response.sendRedirect("GestionarEmpleados.jsp?accion=password_cambiado");
                }

                if (actionString.equals("privilegios")) {
                    response.sendRedirect("GestionarEmpleados.jsp?accion=privilegios_cambiados");
                }

            } else {
                response.sendRedirect("GestionarEmpleados.jsp");
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            response.sendRedirect("error500.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
