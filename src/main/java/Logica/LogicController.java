package Logica;

import Persistencia.PersistenceController;
import java.util.ArrayList;
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
            if (usuario.getUserName().equals(user)) {
                if (usuario.getPassword().equals(password)) {
                    ingresar = true;
                } else {
                    ingresar = false;
                }
            }
        }
        
        return ingresar;
    }
    
}
