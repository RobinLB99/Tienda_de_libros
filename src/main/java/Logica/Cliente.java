package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;

/**
 *
 * @author joel
 */
@Entity
public class Cliente extends Persona implements Serializable {

    private String direccion;

    public Cliente() {
    }

    public Cliente(String direccion, long id, String cedula, String nombre, String apellidos, Date fechaNacimiento, String telefono) {
        super(id, cedula, nombre, apellidos, fechaNacimiento, telefono);
        this.direccion = direccion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString() {
        return "Cliente{" + "direccion=" + direccion + '}';
    }

}
