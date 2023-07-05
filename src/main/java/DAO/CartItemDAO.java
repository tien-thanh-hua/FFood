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
import model.CartItem;

/**
 *
 * @author Hung
 */
public class CartItemDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CartItemDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select*from CartItem";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public CartItem getCartItem(String gci) {
        CartItem ci = null;
        try {
            ps = conn.prepareStatement("select*from CartItem where cart_item_id=?");
            ps.setString(1, gci);
            rs = ps.executeQuery();
            if (rs.next()) {
                ci = new CartItem(rs.getInt("cart_item_id"), rs.getInt("cart_id"), rs.getShort("food_id"), rs.getDouble("food_price"), rs.getByte("food_quantity"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ci;
    }

    public int AddNew(CartItem ci) {
        String sql = "insert into CartItem values(?,?,?,?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ci.getCart_item_id());
            ps.setInt(2, ci.getCart_id());
            ps.setShort(3, ci.getFood_id());
            ps.setDouble(4, ci.getFood_price());
            ps.setByte(5, ci.getFood_quantity());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from CartItem where cart_item_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(CartItem uci) {
        String sql = "update CartItem set cart_id=?, food_id=?, food_price=?, food_quantity=? where cart_item_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uci.getCart_item_id());
            ps.setInt(2, uci.getCart_id());
            ps.setShort(3, uci.getFood_id());
            ps.setDouble(4, uci.getFood_price());
            ps.setByte(5, uci.getFood_quantity());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

}
