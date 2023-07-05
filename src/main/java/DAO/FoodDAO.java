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
import model.Food;

/**
 *
 * @author Hung
 */
public class FoodDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public FoodDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select*from Food";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Food getFood(String gfo) {
        Food fo = null;
        try {
            ps = conn.prepareStatement("select*from Food where food_id=?");
            ps.setString(1, gfo);
            rs = ps.executeQuery();
            if (rs.next()) {
                fo = new Food(rs.getShort("food_id"), rs.getString("food_name"), rs.getDouble("food_price"), rs.getByte("discount_percent"), rs.getString("food_img_url"), rs.getByte("food_type_id"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fo;
    }

    public int AddNew(Food afo) {
        String sql = "insert into Food values(?,?,?,?,?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setShort(1, afo.getFood_id());
            ps.setString(2, afo.getFood_name());
            ps.setDouble(3, afo.getFood_price());
            ps.setByte(4, afo.getDiscount_percent());
            ps.setString(5, afo.getFood_img_url());
            ps.setByte(6, afo.getFood_type_id());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from Food where food_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(Food ufo) {
        String sql = "update Food set food_name=?, food_price=?, discount_percent=?, food_img_url=?, food_type_id=? where food_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setShort(1, ufo.getFood_id());
            ps.setString(2, ufo.getFood_name());
            ps.setDouble(3, ufo.getFood_price());
            ps.setByte(4, ufo.getDiscount_percent());
            ps.setString(5, ufo.getFood_img_url());
            ps.setByte(6, ufo.getFood_type_id());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}
