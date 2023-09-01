package Logica;

import Persistencia.PersistenceController;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LogicController {

    PersistenceController perControl = new PersistenceController();

    // Empleados
    public void crearEmpleado(Empleado empleado) {
        perControl.crearEmpleado(empleado);
    }

    public void editarEmpleado(Empleado empleado) {
        perControl.editarEmpleado(empleado);
    }

    public void eliminarEmpleado(long id) {
        perControl.eliminarEmpleado(id);
    }

    public Empleado buscarEmpleado(long id) {
        return perControl.buscarEmpleado(id);
    }

    public List listaEmpleados() {
        return perControl.listaEmpleados();
    }

    //Acceso
    public void crearAcceso(Acceso credencial) {
        perControl.crearAcceso(credencial);
    }

    public void editarAcceso(Acceso credencial) {
        perControl.editarAcceso(credencial);
    }

    public void eliminarAcceso(long id) {
        perControl.eliminarAcceso(id);
    }

    public Acceso buscarAcceso(long id) {
        return perControl.buscarAcceso(id);
    }

    public List listaAccesos() {
        return perControl.listaAccesos();
    }

    // Libro
    public void crearLibro(Libro libro) {
        perControl.crearLibro(libro);
    }

    public void editarLibro(Libro libro) {
        perControl.editarLibro(libro);
    }

    public void eliminarLibro(long id) {
        perControl.eliminarLibro(id);
    }

    public Libro buscarLibro(long id) {
        return perControl.buscarLibro(id);
    }

    public List<Libro> listaLibros() {
        return perControl.listaLibros();
    }

    // Sesion
    public boolean valSession(String user, String password) {
        /**
         * Valida si existe un usuario. Devuele false si una credencial tiene
         * como username "-" Devuelve false si la contraseña ingresada no
         * coincide con la del registro encontrado. Devuelve true si el username
         * y password ingresado coinciden con un registro.
         */
        List<Acceso> listaAccesos = new ArrayList<Acceso>();
        listaAccesos = perControl.listaAccesos();

        boolean ingresar = false;

        for (Acceso credencial : listaAccesos) {
            if (user.equals("-")) {
                ingresar = false;
                break;
            } else {
                if (credencial.getUserName().equals(user)) {
                    if (credencial.getPassword().equals(password)) {
                        ingresar = true;
                        break;
                    } else {
                        ingresar = false;
                        break;
                    }
                }
            }
        }

        return ingresar;
    }

    /**
     * Metodos para el valor del atributo de sesión "accion"
     */
    public void setActionSessionAttribute(HttpServletRequest request, String attribute) {
        HttpSession accion = request.getSession();
        accion.setAttribute("accion", attribute);
    }

    /**
     * Metodos para Servellets
     */
    public void redirectToServellet(HttpServletRequest request, HttpServletResponse response, String URL)
            throws ServletException, IOException {
        // Redirige a otro Servellet mediante la encapsulacion de la solicitud y seteo de atributo.
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(URL);
        HttpServletRequestWrapper wrapper = new HttpServletRequestWrapper(request);
        wrapper.setAttribute("method", "doPost");
        dispatcher.forward(wrapper, response);
    }

    /**
     * ----- Metodos para fechas -----
     */
    public Date getTypeDate(String stringFecha) {
        // Obtine la la fecha de tipo string "1985-05-06" convertida a tipo Date
        String[] arrStringDate = stringFecha.split("-");

        LocalDate fechaPersonalizada = LocalDate.of(
                Integer.parseInt(arrStringDate[0]),
                Integer.parseInt(arrStringDate[1]),
                Integer.parseInt(arrStringDate[2])
        );

        Instant instant = fechaPersonalizada.atStartOfDay(ZoneId.systemDefault()).toInstant();

        return Date.from(instant);
    }

    public String getShortDateString(Date longDate) {
        // Convierte la fecha larga de tipo Date a un String de formato corto
        SimpleDateFormat formatoFechaSimple = new SimpleDateFormat("MMM dd, yyyy");
        return formatoFechaSimple.format(longDate);
    }

    public String getShortDateStringForInput(Date longDate) {
        /* Convierte la fecha larga de tipo Date a un String de formato corto
        para un input de tipo fecha */
        SimpleDateFormat formatoFechaSimple = new SimpleDateFormat("yyyy-MM-dd");
        return formatoFechaSimple.format(longDate);
    }

    /**
     * ----- Seteo de valores ----- *
     */
    // Establece Acceso y sus valores
    public Acceso setCredentialsValues(String userName, String password, boolean isAdmin, boolean newOrChangePassword) {
        Acceso credencial = new Acceso();
        credencial.setUserName(userName);
        credencial.setPassword(password);
        credencial.setAdmin(isAdmin);
        credencial.setNewOrChangePassword(newOrChangePassword);
        return credencial;
    }

    // Modifica todos los valores de la credencial activa
    public Acceso modCredentialsValues(Acceso credencial, String userName, String password, boolean isAdmin, boolean newOrChangePassword) {
        credencial.setUserName(userName);
        credencial.setPassword(password);
        credencial.setAdmin(isAdmin);
        credencial.setNewOrChangePassword(newOrChangePassword);
        return credencial;
    }

    // Empleado
    public Empleado setEmployData(String cedula, String nombres, String apellidos, Date nacimiento, String telefono, String cargo, Acceso credenciales) {
        Empleado empleado = new Empleado();
        empleado.setCedula(cedula);
        empleado.setNombre(nombres);
        empleado.setApellidos(apellidos);
        empleado.setFechaNacimiento(nacimiento);
        empleado.setTelefono(telefono);
        empleado.setFuncion(cargo);
        empleado.setCredencial(credenciales);
        return empleado;
    }
}
