package DAOs;

import Models.Conexion;
import Models.Trabajadores;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TrabajadoresDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();

    public boolean RegistrarTrabajador(Trabajadores trab) {
        String sql = "INSERT INTO trabajadores (nombre, telefono, correo, usuario, clave, roles_idroles) VALUES (?,?,?,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, trab.getNombre());
            ps.setLong(2, trab.getTelefono());
            ps.setString(3, trab.getCorreo());
            ps.setString(4, trab.getUsuario());
            ps.setString(5, trab.getClave());
            ps.setLong(6, trab.getIdrol());
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

    public Trabajadores log(String username, String clave) {
        Trabajadores trab = new Trabajadores();
        String sql = "SELECT t.idtrabajadores, t.nombre, t.usuario, t.clave, r.rol from trabajadores t, roles r WHERE t.usuario = ? AND t.clave = ? AND t.roles_idroles = r.idroles";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, clave);
            rs = ps.executeQuery();

            if (rs.next()) {
                trab.setIdtrabajadores(rs.getLong("idtrabajadores"));
                trab.setNombre(rs.getString("nombre"));
                trab.setUsuario(rs.getString("usuario"));
                trab.setClave(rs.getString("clave"));
                trab.setRol(rs.getString("rol"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return trab;
    }
}
