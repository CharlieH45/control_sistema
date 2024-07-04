package Models;

public class Usuarios {
    private int idusuario;
    private String nombre_usuario;
    private String username;
    private String clave;

    public Usuarios() {
    }

    public Usuarios(int idusuario, String nombre_usuario, String username, String clave) {
        this.idusuario = idusuario;
        this.nombre_usuario = nombre_usuario;
        this.username = username;
        this.clave = clave;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    
    
}
