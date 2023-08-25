package Logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author ROBINLB99
 */
@Entity
public class Libro implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long id;
    private String codigo;
    private String nombre;
    private String autor;
    private String anio;
    private double precio;
    private int unidades;

    public Libro() {
    }

    public Libro(long id, String codigo, String nombre, String autor, String anio, double precio, int unidades) {
        this.id = id;
        this.codigo = codigo;
        this.nombre = nombre;
        this.autor = autor;
        this.anio = anio;
        this.precio = precio;
        this.unidades = unidades;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getUnidades() {
        return unidades;
    }

    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }

    @Override
    public String toString() {
        return "Libros{" + "id=" + id
                + ", codigo=" + codigo
                + ", nombre=" + nombre
                + ", autor=" + autor
                + ", anio=" + anio
                + ", precio=" + precio + '}';
    }

}
