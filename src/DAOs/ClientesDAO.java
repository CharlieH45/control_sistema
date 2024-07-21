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
            ps.setString(1, cl.getNombre());
            ps.setLong(2, cl.getDocumento());
            ps.setString(3, cl.getDireccion());
            ps.setString(4, cl.getCorreo());
            ps.setLong(5, cl.getTelefono());
            ps.setLong(6, cl.getTelefono2());
            ps.setString(7, cl.getTrabajador());
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
            ps.setString(1, cl.getNombre());
            ps.setLong(2, cl.getDocumento());
            ps.setString(3, cl.getDireccion());
            ps.setString(4, cl.getCorreo());
            ps.setLong(5, cl.getTelefono());
            ps.setLong(6, cl.getTelefono2());
            ps.setString(7, cl.getTrabajador());
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
                cl.setNombre(rs.getString("nombre"));
                cl.setDocumento(rs.getLong("documento"));
                cl.setDireccion(rs.getString("direccion"));
                cl.setCorreo(rs.getString("correo"));
                cl.setTelefono(rs.getLong("telefono"));
                cl.setTelefono2(rs.getLong("telefono2"));
                cl.setTrabajador(rs.getString("trabajadores_idtrabajadores"));
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
                cl.setNombre(rs.getString("nombre_cliente"));
                cl.setDocumento(rs.getLong("documento_cliente"));
                cl.setDireccion(rs.getString("direccion_cliente"));
                cl.setCorreo(rs.getString("correo_cliente"));
                cl.setTelefono(rs.getLong("telefono_cliente"));
                cl.setTelefono2(rs.getLong("telefono2_cliente"));
                cl.setTrabajador(rs.getString("trabajadores_idtrabajadores"));
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
            ps.setString(1, cl.getNombre());
            ps.setLong(2, cl.getDocumento());
            ps.setString(3, cl.getDireccion());
            ps.setString(4, cl.getCorreo());
            ps.setLong(5, cl.getTelefono());
            ps.setLong(6, cl.getTelefono2());
            ps.setString(7, cl.getTrabajador());
            ps.setLong(7, cl.getIdclientes());
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
