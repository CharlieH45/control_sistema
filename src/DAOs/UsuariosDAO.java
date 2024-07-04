package DAOs;

import Models.Conexion;
import Models.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuariosDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();
    
    public Usuarios log(String username, String clave){
        Usuarios us = new Usuarios();
        String sql = "SELECT * FROM usuarios WHERE username = ? AND clave = ?";
        
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            
            if(rs.next()){
                us.setIdusuario(rs.getInt("idusuarios"));
                us.setNombre_usuario(rs.getString("nombre_usuario"));
                us.setUsername(rs.getString("username"));
                us.setClave(rs.getString("clave"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return us;
    }
}
