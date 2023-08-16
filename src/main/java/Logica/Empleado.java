package Logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Empleado extends Persona implements Serializable {
    
    private String funcion;
    @OneToOne
    private Usuario usuario;

    public Empleado() {
    }

    public Empleado(String funcion, Usuario usuario, long id, String cedula, String nombre, String apellidos, String fechaNacimiento, String telefono) {
        super(id, cedula, nombre, apellidos, fechaNacimiento, telefono);
        this.funcion = funcion;
        this.usuario = usuario;
    }
    

    public String getFuncion() {
        return funcion;
    }

    public void setFuncion(String funcion) {
        this.funcion = funcion;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return "Empleado{" + "funcion=" + funcion + ", usuario=" + usuario + '}';
    }
    
}
