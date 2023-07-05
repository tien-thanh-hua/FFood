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
import model.AdminFood;

/**
 *
 * @author Hung
 */
public class AdminFoodDAO {
    
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public AdminFoodDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }
    
    public ResultSet getAll() {
        String sql = "select*from AdminFood";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(AdminFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public AdminFood getAdminFood(String gadf) {
        AdminFood adf = null;
        try {
            ps = conn.prepareStatement("select*from AdminFood where admin_id=?");
            ps.setString(1, gadf);
            rs = ps.executeQuery();
            if (rs.next()) {
                adf = new AdminFood(rs.getByte("admin_id"), Short.valueOf(rs.getString("food_id")));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AdminFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return adf;
    }
    
    public int AddNew(AdminFood aadf) {
        String sql = "insert into AdminFood values(?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, String.valueOf(aadf.getAdmin_id()));
            ps.setString(2, String.valueOf(aadf.getFood_id()));
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
    
    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from AdminFood where admin_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
    
    public int Update(AdminFood uadf) {
        String sql = "update AdminFood set food_id=? where admin_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, String.valueOf(uadf.getAdmin_id()));
            ps.setString(2, String.valueOf(uadf.getFood_id()));
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AdminFoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
    
}
