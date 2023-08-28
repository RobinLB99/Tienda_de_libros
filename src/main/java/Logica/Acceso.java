package Logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Acceso implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long id;
    private String userName;
    private String password;
    private boolean admin;
    private boolean newOrChangePassword;

    public Acceso() {
    }

    public Acceso(long id, String userName, String password, boolean admin, boolean newOrChangePassword) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.admin = admin;
        this.newOrChangePassword = newOrChangePassword;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public boolean isNewOrChangePassword() {
        return newOrChangePassword;
    }

    public void setNewOrChangePassword(boolean newOrChangePassword) {
        this.newOrChangePassword = newOrChangePassword;
    }

}
