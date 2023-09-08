package Persistencia;

import Logica.Empleado;
import Logica.Libro;
import Logica.Acceso;
import Logica.Alquiler;
import Logica.CantidadLibroPedido;
import Logica.Cliente;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PersistenceController {

    EmpleadoJpaController employJpa = new EmpleadoJpaController();
    AccesoJpaController userJpa = new AccesoJpaController();
    LibroJpaController bookJpa = new LibroJpaController();
    ClienteJpaController clientJpa = new ClienteJpaController();
    CantidadLibroPedidoJpaController nlibroPedidoJpa = new CantidadLibroPedidoJpaController();
    AlquilerJpaController alquilerJpa = new AlquilerJpaController();

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
    
    /**
     * Libros pedidos
     */
    public void crearRegistroCantidadPedida(CantidadLibroPedido nLibroPedido) {
        nlibroPedidoJpa.create(nLibroPedido);
    }
    
    public void editarRegistroCantidadPedida(CantidadLibroPedido nLibroPedido) {
        try {
            nlibroPedidoJpa.edit(nLibroPedido);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarRegistroCantidadPedida(long id) {
        try {
            nlibroPedidoJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public CantidadLibroPedido registroLibroPedido(long id) {
        return nlibroPedidoJpa.findCantidadLibroPedido(id);
    }
    
    public List<CantidadLibroPedido> listaRegistroLibroPedidos() {
        return nlibroPedidoJpa.findCantidadLibroPedidoEntities();
    }
    
    /**
     * Factura Alquiler
     */
    public void createFacturaAlquiler(Alquiler alquiler) {
        alquilerJpa.create(alquiler);
    }
    
    public void editFacturaAlquiler(Alquiler alquiler) {
        try {
            alquilerJpa.edit(alquiler);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void destroyFacturaAlquiler(long id) {
        try {
            alquilerJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Alquiler findFacturaAlquiler(long id) {
        return alquilerJpa.findAlquiler(id);
    }
    
    public List<Alquiler> findListaFacturasAlquiler() {
        return alquilerJpa.findAlquilerEntities();
    }

    /**
     * Clientes
     */
    public void crearCliente(Cliente cliente) {
        clientJpa.create(cliente);
    }

    public void editarCliente(Cliente cliente) {
        try {
            clientJpa.edit(cliente);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarCliente(long id) {
        try {
            clientJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Cliente buscarCliente(long id) {
        return clientJpa.findCliente(id);
    }

    public List<Cliente> listaClientes() {
        return clientJpa.findClienteEntities();
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

    /* Credenciales de acceso */
    public void crearAcceso(Acceso user) {
        userJpa.create(user);
    }

    public void editarAcceso(Acceso user) {
        try {
            userJpa.edit(user);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarAcceso(long id) {
        try {
            userJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Acceso buscarAcceso(long id) {
        return userJpa.findAcceso(id);
    }

    public List listaAccesos() {
        return userJpa.findAccesoEntities();
    }

}
