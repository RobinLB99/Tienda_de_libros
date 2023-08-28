package Logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Empleado extends Persona implements Serializable {

    private String funcion;
    @OneToOne
    private Acceso credencial;

    public Empleado() {
    }

    public Empleado(String funcion, Acceso credencial, long id, String cedula, String nombre, String apellidos, Date fechaNacimiento, String telefono) {
        super(id, cedula, nombre, apellidos, fechaNacimiento, telefono);
        this.funcion = funcion;
        this.credencial = credencial;
    }

    public String getFuncion() {
        return funcion;
    }

    public void setFuncion(String funcion) {
        this.funcion = funcion;
    }

    public Acceso getCredencial() {
        return credencial;
    }

    public void setCredencial(Acceso credencial) {
        this.credencial = credencial;
    }

    @Override
    public String toString() {
        return "Empleado{" + "funcion=" + funcion + ", credencial=" + credencial + '}';
    }

}
