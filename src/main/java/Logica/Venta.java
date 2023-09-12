package Logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author joel
 */
@Entity
public class Venta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String numFactura;
    @OneToMany
    private List<CantidadLibroPedido> librosPedidos;
    private Cliente cliente;
    private Empleado empleado;

    public Venta() {
    }

    public Venta(long id, String numFactura, List<CantidadLibroPedido> librosPedidos, Cliente cliente, Empleado empleado) {
        this.id = id;
        this.numFactura = numFactura;
        this.librosPedidos = librosPedidos;
        this.cliente = cliente;
        this.empleado = empleado;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNumFactura() {
        return numFactura;
    }

    public void setNumFactura(String numFactura) {
        this.numFactura = numFactura;
    }

    public List<CantidadLibroPedido> getLibrosPedidos() {
        return librosPedidos;
    }

    public void setLibrosPedidos(List<CantidadLibroPedido> librosPedidos) {
        this.librosPedidos = librosPedidos;
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

    @Override
    public String toString() {
        return "Venta{" + "id=" + id + ", numFactura=" + numFactura + ", librosPedidos=" + librosPedidos + ", cliente=" + cliente + ", empleado=" + empleado + '}';
    }

}
