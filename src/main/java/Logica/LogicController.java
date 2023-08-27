package Logica;

import Persistencia.PersistenceController;
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

    //Usuario
    public void crearUsuario(Usuario user) {
        perControl.crearUsuario(user);
    }

    public void editarUsuario(Usuario user) {
        perControl.editarUsuario(user);
    }

    public void eliminarUsuario(long id) {
        perControl.eliminarUsuario(id);
    }

    public Usuario buscarUsuario(long id) {
        return perControl.buscarUsuario(id);
    }

    public List listaUsuarios() {
        return perControl.listaUsuarios();
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
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = perControl.listaUsuarios();

        boolean ingresar = false;

        for (Usuario usuario : listaUsuarios) {
            if (user.equals("-")) {
                ingresar = false;
                break;
            } else {
                if (usuario.getUserName().equals(user)) {
                    if (usuario.getPassword().equals(password)) {
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
     * ----- Metodos para fechas -----
     */
    /* Obtine la la fecha de tipo string "1985-05-06" convertida a tipo Date */
    public Date getTypeDate(String stringFecha) {
        String[] arrStringDate = stringFecha.split("-");

        LocalDate fechaPersonalizada = LocalDate.of(
                Integer.parseInt(arrStringDate[0]),
                Integer.parseInt(arrStringDate[1]),
                Integer.parseInt(arrStringDate[2])
        );

        Instant instant = fechaPersonalizada.atStartOfDay(ZoneId.systemDefault()).toInstant();

        return Date.from(instant);
    }
    
    /* Convierte la fecha larga de tipo Date a un String de formato corto */
    public String getShortDateString(Date longDate) {
        SimpleDateFormat formatoFechaSimple = new SimpleDateFormat("MMM dd, yyyy");
        return formatoFechaSimple.format(longDate);
    }

    /**
     * ----- Seteo de valores ----- *
     */
    // Usuario
    public Usuario setCredentialsValues(String userName, String password, boolean isAdmin) {
        Usuario usuario = new Usuario();
        usuario.setUserName(userName);
        usuario.setPassword(password);
        usuario.setAdmin(isAdmin);
        return usuario;
    }

    // Empleado
    public Empleado setEmployData(String cedula, String nombres, String apellidos, Date nacimiento, String telefono, String cargo, Usuario credenciales) {
        Empleado empleado = new Empleado();
        empleado.setCedula(cedula);
        empleado.setNombre(nombres);
        empleado.setApellidos(apellidos);
        empleado.setFechaNacimiento(nacimiento);
        empleado.setTelefono(telefono);
        empleado.setFuncion(cargo);
        empleado.setUsuario(credenciales);
        return empleado;
    }
}
