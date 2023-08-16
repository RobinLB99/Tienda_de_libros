package Servellets;

import Logica.Empleado;
import Logica.LogicController;
import Logica.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SvEmpleado", urlPatterns = {"/SvEmpleado"})
public class SvEmpleado extends HttpServlet {

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
        
        LogicController control = new LogicController();
        
        String nombres = request.getParameter("inputName");
        String apellidos = request.getParameter("inputLastName");
        String cedula = request.getParameter("inputCI");
        String userName = request.getParameter("inputUserName");
        String password = request.getParameter("inputPassword");
        String rol = request.getParameter("select-rol");
        
        Usuario user = new Usuario();
        user.setUserName(userName);
        user.setPassword(password);
        
        control.crearUsuario(user);
        
        Empleado employ = new Empleado();
        employ.setNombre(nombres);
        employ.setApellidos(apellidos);
        employ.setCedula(cedula);
        employ.setUsuario(user);
        employ.setFuncion(rol);
        
        System.out.println(employ);
        
        control.crearEmpleado(employ);
        
        response.sendRedirect("index.jsp");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
