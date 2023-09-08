package Logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author joel
 */
@Entity
public class CantidadLibroPedido implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private Libro libro;
    private int cantidad;

    public CantidadLibroPedido() {
    }

    public CantidadLibroPedido(long id, Libro libro, int cantidad) {
        this.id = id;
        this.libro = libro;
        this.cantidad = cantidad;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Libro getLibro() {
        return libro;
    }

    public void setLibro(Libro libro) {
        this.libro = libro;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return "CantidadLibroPedido{" + "id=" + id + ", libro=" + libro + ", cantidad=" + cantidad + '}';
    }

}
