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
import model.OrderStatus;

/**
 *
 * @author Hung
 */
public class OrderStatusDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderStatusDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select*from OrderStatus";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(OrderStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public OrderStatus getOrderStatus(String gods) {
        OrderStatus ods = null;
        try {
            ps = conn.prepareStatement("select*from OrderStatus where food_id=?");
            ps.setString(1, gods);
            rs = ps.executeQuery();
            if (rs.next()) {
                ods = new OrderStatus(rs.getByte("order_status_id"), rs.getString("order_status"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ods;
    }

    public int AddNew(OrderStatus aods) {
        String sql = "insert into OrderStatus values(?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setByte(1, aods.getOrder_status_id());
            ps.setString(2, aods.getOrder_status());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from OrderStatus where order_status_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(OrderStatus ufot) {
        String sql = "update OrderStatus set order_status=? where order_status_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setByte(1, ufot.getOrder_status_id());
            ps.setString(2, ufot.getOrder_status());
        } catch (SQLException ex) {
            Logger.getLogger(OrderStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}
