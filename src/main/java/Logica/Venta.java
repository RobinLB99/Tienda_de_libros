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
public class Venta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private List<CantidadLibroPedido> librosPedidos;
    private Cliente cliente;
    private Empleado vendedor;

    public Venta() {
    }

    public Venta(long id, List<CantidadLibroPedido> librosPedidos, Cliente cliente, Empleado vendedor) {
        this.id = id;
        this.librosPedidos = librosPedidos;
        this.cliente = cliente;
        this.vendedor = vendedor;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public Empleado getVendedor() {
        return vendedor;
    }

    public void setVendedor(Empleado vendedor) {
        this.vendedor = vendedor;
    }

    @Override
    public String toString() {
        return "Venta{" + "id=" + id + ", librosPedidos=" + librosPedidos + ", cliente=" + cliente + ", vendedor=" + vendedor + '}';
    }

}
