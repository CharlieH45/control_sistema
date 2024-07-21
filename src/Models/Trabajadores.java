package Models;

public class Trabajadores {
    private long idtrabajadores;
    private String nombre;
    private long telefono;
    private String correo;
    private String usuario;
    private String clave;
    private long idrol;
    private String rol;

    public Trabajadores() {
    }

    public Trabajadores(long idtrabajadores, String nombre, long telefono, String correo, String usuario, String clave, long idrol, String rol) {
        this.idtrabajadores = idtrabajadores;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
        this.usuario = usuario;
        this.clave = clave;
        this.idrol = idrol;
        this.rol = rol;
    }

    public long getIdtrabajadores() {
        return idtrabajadores;
    }

    public void setIdtrabajadores(long idtrabajadores) {
        this.idtrabajadores = idtrabajadores;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public long getIdrol() {
        return idrol;
    }

    public void setIdrol(long idrol) {
        this.idrol = idrol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }


    
}
