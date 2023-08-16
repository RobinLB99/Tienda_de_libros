package Persistencia;

import Logica.Empleado;
import Logica.Libro;
import Logica.Usuario;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PersistenceController {
    
    EmpleadoJpaController employJpa = new EmpleadoJpaController();
    UsuarioJpaController userJpa = new UsuarioJpaController();
    LibroJpaController bookJpa = new LibroJpaController();
    
    /* Libros */
    public void crearLibro(Libro libro) {
        bookJpa.create(libro);
    }
    
    public void editarLibro(Libro libro) {
        try {
            bookJpa.edit(libro);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarLibro(long id) {
        try {
            bookJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
    
    public Libro buscarLibro(long id) {
        return bookJpa.findLibro(id);
    }
    
    public List<Libro> listaLibros() {
        return bookJpa.findLibroEntities();
    }
    
    /* Empleados */
    public void crearEmpleado(Empleado employ) {
        employJpa.create(employ);
    }
    
    public void editarEmpleado(Empleado empleado) {
        try {
            employJpa.edit(empleado);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarEmpleado(long id) {
        try {
            employJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Empleado buscarEmpleado(long id) {
        return employJpa.findEmpleado(id);
    }
    
    public List listaEmpleados() {
        return employJpa.findEmpleadoEntities();
    }
    
    /* Usuarios */
    public void crearUsuario(Usuario user) {
        userJpa.create(user);
    }
    
    public void editarUsuario(Usuario user) {
        try {
            userJpa.edit(user);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarUsuario(long id) {
        try {
            userJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Usuario buscarUsuario(long id) {
        return userJpa.findUsuario(id);
    }
    
    public List listaUsuarios() {
        return userJpa.findUsuarioEntities();
    }
    
}
