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

        try {
            control = new LogicController();
            listaEmpleados = control.listaEmpleados();

            HttpSession empleados = request.getSession();
            empleados.setAttribute("listaEmpleados", listaEmpleados);

            response.sendRedirect("GestionarEmpleados.jsp");

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
