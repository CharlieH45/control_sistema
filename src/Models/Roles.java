package Models;


public class Roles {
    private long idroles;
    private String rol;

    public Roles() {
    }

    public Roles(long idroles, String rol) {
        this.idroles = idroles;
        this.rol = rol;
    }

    public long getIdroles() {
        return idroles;
    }

    public void setIdroles(long idroles) {
        this.idroles = idroles;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    public String toString(){
        return rol;
    }
}
