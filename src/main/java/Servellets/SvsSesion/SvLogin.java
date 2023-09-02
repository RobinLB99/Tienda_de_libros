package Servellets;

import Logica.Acceso;
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

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    LogicController control = null;

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

            String username = request.getParameter("userName_");
            String password = request.getParameter("password_");

            // Verfica si existe el usuario y contraseña en la base de datos
            boolean sessionValida = control.valSession(username, password);

            if (sessionValida) {
                
                try {
                    Acceso cAcceso = null;
                    String funcion = "";
                    boolean isChangePasswordRequired = false;
                    long id = 0;
                    
                    List<Empleado> listaEmpleados = control.listaEmpleados();
                    for (Empleado employ : listaEmpleados) {
                        if (employ.getCredencial().getUserName().equals(username)) {
                            cAcceso = employ.getCredencial();
                            isChangePasswordRequired = employ.getCredencial().isNewOrChangePassword();
                            id = employ.getCredencial().getId();
                            funcion = employ.getFuncion();
                            break;
                        }
                    }
                    
                    // Verfica si la credencial de acceso necesita cambio de clave.
//                    List<Acceso> listaCredenciales = control.listaAccesos();
//                    for (Acceso credencial : listaCredenciales) {
//                        if (credencial.getUserName().equals(username)) {
//                            cAcceso = credencial;
//                            isChangePasswordRequired = credencial.isNewOrChangePassword();
//                            id = credencial.getId();
//                            break;
//                        }
//                    }

                    // Si requiere cambio de clave, establece un atributo de sesion y redirige a la pagina de nueva clave.
                    if (isChangePasswordRequired) {
                        HttpSession idAccess = request.getSession();
                        idAccess.setAttribute("idCredencial", id);
                        response.sendRedirect("NuevaClaveUsuario.jsp");
                        
                    } else {
                        HttpSession mySession = request.getSession();
                        mySession.setAttribute("credencial", cAcceso);
                        
                        HttpSession mySessionE = request.getSession();
                        mySessionE.setAttribute("funcion", funcion);
                        
                        response.sendRedirect("index.jsp");
                    }
                    
                } catch (Exception a) {
                    response.sendRedirect("error500.jsp");
                }

            } else {
                response.sendRedirect("login.jsp?access=incorrect");
            }

        } catch (Exception e) {
            response.sendRedirect("error500.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
