package Models;

public class Clientes {
    private int idclientes;
    private String nombre_cliente;
    private long documento_cliente;
    private String direccion_cliente;
    private String correo_cliente;
    private long telefono_cliente;
    private long telefono2_cliente;
    private String usuario;

    public Clientes() {
    }

    public Clientes(int idclientes, String nombre_cliente, long documento_cliente, String direccion_cliente, String correo_cliente, long telefono_cliente, long telefono2_cliente, String usuario) {
        this.idclientes = idclientes;
        this.nombre_cliente = nombre_cliente;
        this.documento_cliente = documento_cliente;
        this.direccion_cliente = direccion_cliente;
        this.correo_cliente = correo_cliente;
        this.telefono_cliente = telefono_cliente;
        this.telefono2_cliente = telefono2_cliente;
        this.usuario = usuario;
    }

    public int getIdclientes() {
        return idclientes;
    }

    public void setIdclientes(int idclientes) {
        this.idclientes = idclientes;
    }

    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public long getDocumento_cliente() {
        return documento_cliente;
    }

    public void setDocumento_cliente(long documento_cliente) {
        this.documento_cliente = documento_cliente;
    }

    public String getDireccion_cliente() {
        return direccion_cliente;
    }

    public void setDireccion_cliente(String direccion_cliente) {
        this.direccion_cliente = direccion_cliente;
    }

    public String getCorreo_cliente() {
        return correo_cliente;
    }

    public void setCorreo_cliente(String correo_cliente) {
        this.correo_cliente = correo_cliente;
    }

    public long getTelefono_cliente() {
        return telefono_cliente;
    }

    public void setTelefono_cliente(long telefono_cliente) {
        this.telefono_cliente = telefono_cliente;
    }

    public long getTelefono2_cliente() {
        return telefono2_cliente;
    }

    public void setTelefono2_cliente(long telefono2_cliente) {
        this.telefono2_cliente = telefono2_cliente;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    
}
