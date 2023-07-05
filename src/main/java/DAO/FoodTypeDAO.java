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
import model.FoodType;

/**
 *
 * @author Hung
 */
public class FoodTypeDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public FoodTypeDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select*from FoodType";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(FoodTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public FoodType getFoodType(String gfot) {
        FoodType ft = null;
        try {
            ps = conn.prepareStatement("select*from FoodType where food_id=?");
            ps.setString(1, gfot);
            rs = ps.executeQuery();
            if (rs.next()) {
                ft = new FoodType(rs.getByte("food_type_id"), rs.getString("food_type"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(FoodTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ft;
    }

    public int AddNew(FoodType aca) {
        String sql = "insert into FoodType values(?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setByte(1, aca.getFood_type_id());
            ps.setString(2, aca.getFood_type());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from FoodType where food_type_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(FoodType ufot) {
        String sql = "update FoodType set food_type=? where food_type_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setByte(1, ufot.getFood_type_id());
            ps.setString(2, ufot.getFood_type());
        } catch (SQLException ex) {
            Logger.getLogger(FoodTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}
