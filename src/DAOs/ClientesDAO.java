package DAOs;

import Models.Conexion;
import Models.Clientes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClientesDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();

    public boolean RegistrarCliente(Clientes cl) {
        String sql = "INSERT INTO clientes (nombre_cliente,documento_cliente,direccion_cliente,correo_cliente,telefono_cliente,telefono2_cliente, trabajador) VALUES (?,?,?,?,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getNombre_cliente());
            ps.setLong(2, cl.getDocumento_cliente());
            ps.setString(3, cl.getDireccion_cliente());
            ps.setString(4, cl.getCorreo_cliente());
            ps.setLong(5, cl.getTelefono_cliente());
            ps.setLong(6, cl.getTelefono2_cliente());
            ps.setString(7, cl.getUsuario());
            ps.execute();

            return true;

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
        }
    }

    public boolean RegistrarHistorialCliente(Clientes cl) {
        String sql = "INSERT INTO historialcliente (nombre_cliente,documento_cliente,direccion_cliente,correo_cliente,telefono_cliente,telefono2_cliente, usuario) VALUES (?,?,?,?,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getNombre_cliente());
            ps.setLong(2, cl.getDocumento_cliente());
            ps.setString(3, cl.getDireccion_cliente());
            ps.setString(4, cl.getCorreo_cliente());
            ps.setLong(5, cl.getTelefono_cliente());
            ps.setLong(6, cl.getTelefono2_cliente());
            ps.setString(7, cl.getUsuario());
            ps.execute();

            return true;

        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
        }
    }

    public List ListarClientes(String usuario) {
        List<Clientes> listacl = new ArrayList();
        String sql = "SELECT * FROM clientes WHERE usuario = ?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            rs = ps.executeQuery();

            while (rs.next()) {
                Clientes cl = new Clientes();
                cl.setIdclientes(rs.getInt("idclientes"));
                cl.setNombre_cliente(rs.getString("nombre_cliente"));
                cl.setDocumento_cliente(rs.getLong("documento_cliente"));
                cl.setDireccion_cliente(rs.getString("direccion_cliente"));
                cl.setCorreo_cliente(rs.getString("correo_cliente"));
                cl.setTelefono_cliente(rs.getLong("telefono_cliente"));
                cl.setTelefono2_cliente(rs.getLong("telefono2_cliente"));
                cl.setUsuario(rs.getString("usuario"));
                listacl.add(cl);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return listacl;
    }
    
    public List ListarHistorialClientes() {
        List<Clientes> ListaCl = new ArrayList();
        String sql = "SELECT * FROM historialcliente";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Clientes cl = new Clientes();
                cl.setNombre_cliente(rs.getString("nombre_cliente"));
                cl.setDocumento_cliente(rs.getLong("documento_cliente"));
                cl.setDireccion_cliente(rs.getString("direccion_cliente"));
                cl.setCorreo_cliente(rs.getString("correo_cliente"));
                cl.setTelefono_cliente(rs.getLong("telefono_cliente"));
                cl.setTelefono2_cliente(rs.getLong("telefono2_cliente"));
                cl.setUsuario(rs.getString("usuario"));
                ListaCl.add(cl);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return ListaCl;
    }

    public boolean ActualizarCliente(Clientes cl) {
        String sql = "UPDATE clientes SET nombre_cliente=?, documento_cliente=?, direccion_cliente=?, correo_cliente=?, telefono_cliente=?, telefono2_cliente=?, usuario=? WHERE idclientes=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getNombre_cliente());
            ps.setLong(2, cl.getDocumento_cliente());
            ps.setString(3, cl.getDireccion_cliente());
            ps.setString(4, cl.getCorreo_cliente());
            ps.setLong(5, cl.getTelefono_cliente());
            ps.setLong(6, cl.getTelefono2_cliente());
            ps.setString(7, cl.getUsuario());
            ps.setInt(7, cl.getIdclientes());
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
        }
    }

    public boolean EliminarCliente(int id) {
        String sql = "DELETE FROM clientes WHERE idclientes = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            return true;
        } catch (SQLException e) {
            System.out.println(e.toString());
            return false;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.toString());
            }
        }
    }
}
