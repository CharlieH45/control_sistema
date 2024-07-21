package Models;

public class Clientes {
    private long idclientes;
    private String nombre;
    private long documento;
    private String direccion;
    private String correo;
    private long telefono;
    private long telefono2;
    private String trabajador;

    public Clientes() {
    }

    public Clientes(long idclientes, String nombre, long documento, String direccion, String correo, long telefono, long telefono2, String trabajador) {
        this.idclientes = idclientes;
        this.nombre = nombre;
        this.documento = documento;
        this.direccion = direccion;
        this.correo = correo;
        this.telefono = telefono;
        this.telefono2 = telefono2;
        this.trabajador = trabajador;
    }

    public long getIdclientes() {
        return idclientes;
    }

    public void setIdclientes(long idclientes) {
        this.idclientes = idclientes;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public long getDocumento() {
        return documento;
    }

    public void setDocumento(long documento) {
        this.documento = documento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public long getTelefono2() {
        return telefono2;
    }

    public void setTelefono2(long telefono2) {
        this.telefono2 = telefono2;
    }

    public String getTrabajador() {
        return trabajador;
    }

    public void setTrabajador(String trabajador) {
        this.trabajador = trabajador;
    }


    
}
