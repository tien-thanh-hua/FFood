/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

/**
 *
 * @author Hung
 */
public class AdminDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public AdminDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select*from Admin";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Admin getAdmin(String gad) {
        Admin ad = null;
        try {
            ps = conn.prepareStatement("select*from Admin where admin_id=?");
            ps.setString(1, gad);
            rs = ps.executeQuery();
            if (rs.next()) {
                ad = new Admin(rs.getByte("admin_id"), rs.getString("admin_fullname"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ad;
    }

    public int AddNew(Admin aad) {
        String sql = "insert into Admin values(?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, String.valueOf(aad.getAdmin_id()));
            ps.setString(2, aad.getAdmin_fullname());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from Admin where admin_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(Admin uad) {
        String sql = "update Admin set admin_fullname=? where admin_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, String.valueOf(uad.getAdmin_id()));
            ps.setString(2, uad.getAdmin_fullname());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

}
