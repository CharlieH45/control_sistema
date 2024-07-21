package DAOs;

import Models.Conexion;
import Models.Roles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RolesDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();

    public ArrayList<Roles> ListarRoles() {
        ArrayList<Roles> llenarComboBox = new ArrayList<>();
        String sql = "SELECT * FROM roles";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            

            while (rs.next()) {
                Roles r = new Roles();
                r.setIdroles(rs.getInt("idroles"));
                r.setRol(rs.getString("rol"));
                
                llenarComboBox.add(r);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return llenarComboBox;
    }
}
