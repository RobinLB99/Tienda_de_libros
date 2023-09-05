package Logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author joel
 */
@Entity
public class Alquiler implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private List<Libro> libros;
    private Cliente cliente;
    private Empleado empleado;
    private String estadoAlquiler;

    public Alquiler() {
    }

    public Alquiler(long id, List<Libro> libros, Cliente cliente, Empleado empleado, String estadoAlquiler) {
        this.id = id;
        this.libros = libros;
        this.cliente = cliente;
        this.empleado = empleado;
        this.estadoAlquiler = estadoAlquiler;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Libro> getLibros() {
        return libros;
    }

    public void setLibros(List<Libro> libros) {
        this.libros = libros;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public String getEstadoAlquiler() {
        return estadoAlquiler;
    }

    public void setEstadoAlquiler(String estadoAlquiler) {
        this.estadoAlquiler = estadoAlquiler;
    }

    @Override
    public String toString() {
        return "Alquiler{" + "id=" + id + ", libros=" + libros + ", cliente=" + cliente + ", empleado=" + empleado + '}';
    }

}
