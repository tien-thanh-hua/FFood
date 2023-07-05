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
import model.Order;

/**
 *
 * @author Hung
 */
public class OrderDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public OrderDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select*from Order";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Order getOrder(String god) {
        Order od = null;
        try {
            ps = conn.prepareStatement("select*from Order where order_id=?");
            ps.setString(1, god);
            rs = ps.executeQuery();
            if (rs.next()) {
                od = new Order(rs.getInt("order_id"), rs.getInt("cart_id"), rs.getInt("customer_id"), rs.getByte("order_status_id"), rs.getByte("payment_method_id"), rs.getDate("order_time"), rs.getDouble("order_total"), rs.getString("order_note"), rs.getDate("delivery_time"), rs.getString("contact_phone"), rs.getDate("order_cancel_time"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return od;
    }

    public int AddNew(Order aod) {
        String sql = "insert into Order values(?,?,?,?,?,?,?,?,?,?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, aod.getOrder_id());
            ps.setInt(2, aod.getCart_id());
            ps.setInt(1, aod.getCustomer_id());
            ps.setByte(2, aod.getOrder_status_id());
            ps.setByte(1, aod.getPayment_method_id());
            ps.setDate(2, aod.getOrder_time());
            ps.setDouble(1, aod.getOrder_total());
            ps.setString(2, aod.getOrder_note());
            ps.setDate(1, aod.getDelivery_time());
            ps.setString(2, aod.getContact_phone());
            ps.setDate(1, aod.getOrder_cancel_time());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from Order where order_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(Order od) {
        String sql = "update Order set cart_id=?, customer_id=?, order_status_id=?, payment_method_id=?, order_time=?, order_total=?, order_note=?, delivery_time=?, contact_phone=?, order_cancel_time=? where order_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, od.getOrder_id());
            ps.setInt(2, od.getCart_id());
            ps.setInt(1, od.getCustomer_id());
            ps.setByte(2, od.getOrder_status_id());
            ps.setByte(1, od.getPayment_method_id());
            ps.setDate(2, od.getOrder_time());
            ps.setDouble(1, od.getOrder_total());
            ps.setString(2, od.getOrder_note());
            ps.setDate(1, od.getDelivery_time());
            ps.setString(2, od.getContact_phone());
            ps.setDate(1, od.getOrder_cancel_time());
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}
