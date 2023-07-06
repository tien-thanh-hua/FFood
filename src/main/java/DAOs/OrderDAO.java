/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.Order;

/**
 *
 * @author Hung
 */
public class OrderDAO {

  private Connection conn;
  private PreparedStatement ps;
  private ResultSet rs;

  public OrderDAO() {
    conn = DBConnection.DBConnection.getConnection();
  }

  public ResultSet getAll() {
    String sql = "select * from [Order]";
    try {
      ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
      return rs;
    } catch (SQLException ex) {
      Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }

  public Order getOrder(int orderID) {
    Order order = null;
    try {
      ps = conn.prepareStatement("select * from [Order] where order_id = ?");
      ps.setInt(1, orderID);
      rs = ps.executeQuery();
      if (rs.next()) {
        order = new Order(rs.getInt("order_id"),
                rs.getInt("cart_id"),
                rs.getInt("customer_id"),
                rs.getByte("order_status_id"),
                this.getOrderStatus(rs.getByte("order_status_id")),
                rs.getByte("payment_method_id"),
                this.getPaymentMethod(rs.getByte("payment_method_id")),
                rs.getDate("order_time"),
                rs.getBigDecimal("order_total"),
                rs.getString("order_note"),
                rs.getDate("delivery_time"),
                rs.getString("contact_phone"),
                rs.getDate("order_cancel_time"));
      }
    } catch (SQLException ex) {
      Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return order;
  }

  public int add(Order order) {
    String sql = "insert into [Order] (cart_id, customer_id, order_status_id, payment_method_id, order_time, order_total, order_note, delivery_time, contact_phone, order_cancel_time) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    int result = 0;
    try {
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setInt(1, order.getCartID());
      ps.setInt(2, order.getCustomerID());
      ps.setByte(3, order.getOrderStatusID());
      ps.setByte(4, order.getPaymentMethodID());
      ps.setDate(5, order.getOrderTime());
      ps.setBigDecimal(6, order.getOrderTotal());
      ps.setString(7, order.getOrderNote());
      ps.setDate(8, order.getDeliveryTime());
      ps.setString(9, order.getContactPhone());
      ps.setDate(10, order.getOrderCancelTime());
      result = ps.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return result;
  }

  public int delete(int orderID) {
    int result = 0;
    String sql = "delete from [Order] where order_id = ?";
    try {
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setInt(1, orderID);
      result = ps.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return result;
  }

  public int update(Order order) {
    String sql = "update [Order] set cart_id = ?, customer_id = ?, order_status_id = ?, payment_method_id = ?, order_time = ?, order_total = ?, order_note = ?, delivery_time = ?, contact_phone = ?, order_cancel_time = ? where order_id = ?";
    int result = 0;
    try {
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setInt(1, order.getCartID());
      ps.setInt(2, order.getCustomerID());
      ps.setByte(3, order.getOrderStatusID());
      ps.setByte(4, order.getPaymentMethodID());
      ps.setDate(5, order.getOrderTime());
      ps.setBigDecimal(6, order.getOrderTotal());
      ps.setString(7, order.getOrderNote());
      ps.setDate(8, order.getDeliveryTime());
      ps.setString(9, order.getContactPhone());
      ps.setDate(10, order.getOrderCancelTime());
      ps.setInt(11, order.getOrderID());
    } catch (SQLException ex) {
      Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return result;
  }

  public String getPaymentMethod(byte paymentMethodID) {
    String paymentMethod = null;
    try {
      ps = conn.prepareStatement("select * from PaymentMethod where payment_method_id = ?");
      ps.setByte(1, paymentMethodID);
      rs = ps.executeQuery();
      if (rs.next()) {
        paymentMethod = rs.getString("payment_method");
      }
    } catch (SQLException ex) {
      Logger.getLogger(FoodTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return paymentMethod;
  }

  public String getOrderStatus(byte orderStatusID) {
    String orderStatus = null;
    try {
      ps = conn.prepareStatement("select * from OrderStatus where order_status_id = ?");
      ps.setByte(1, orderStatusID);
      rs = ps.executeQuery();
      if (rs.next()) {
        orderStatus = rs.getString("order_status");
      }
    } catch (SQLException ex) {
      Logger.getLogger(FoodTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return orderStatus;
  }
}
