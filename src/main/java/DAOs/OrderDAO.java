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
import java.util.ArrayList;
import java.util.List;

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

  public List<Order> getAllList() {
    ResultSet orderRS = this.getAll();
    List<Order> orderList = new ArrayList<>();
    try {
      while (orderRS.next()) {
        Order order = new Order(orderRS.getInt("order_id"),
                orderRS.getInt("cart_id"),
                orderRS.getInt("customer_id"),
                orderRS.getByte("order_status_id"),
                this.getOrderStatus(orderRS.getByte("order_status_id")),
                orderRS.getByte("payment_method_id"),
                this.getPaymentMethod(orderRS.getByte("payment_method_id")),
                orderRS.getString("contact_phone"),
                orderRS.getString("delivery_address"),
                this.getOrderItemsList(orderRS.getInt("cart_id")),
                orderRS.getBigDecimal("order_total"),
                orderRS.getDate("order_time"),
                orderRS.getString("order_note"),
                orderRS.getDate("delivery_time"),
                orderRS.getDate("order_cancel_time"));
        orderList.add(order);
      }
    } catch (SQLException ex) {
      Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return orderList;
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
                rs.getString("contact_phone"),
                rs.getString("delivery_address"),
                this.getOrderItemsList(rs.getInt("cart_id")),
                rs.getBigDecimal("order_total"),
                rs.getDate("order_time"),
                rs.getString("order_note"),
                rs.getDate("delivery_time"),
                rs.getDate("order_cancel_time"));
      }
    } catch (SQLException ex) {
      Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return order;
  }

  public int add(Order order) {
    String sql = "insert into [Order] (cart_id, customer_id, order_status_id, payment_method_id, contact_phone, delivery_address, order_total, order_time, order_note, delivery_time, order_cancel_time) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    int result = 0;
    try {
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setInt(1, order.getCartID());
      ps.setInt(2, order.getCustomerID());
      ps.setByte(3, order.getOrderStatusID());
      ps.setByte(4, order.getPaymentMethodID());
      ps.setString(5, order.getContactPhone());
      ps.setString(6, order.getDeliveryAddress());
      ps.setBigDecimal(7, order.getOrderTotal());
      ps.setDate(8, order.getOrderTime());
      ps.setString(9, order.getOrderNote());
      ps.setDate(10, order.getDeliveryTime());
      ps.setDate(11, order.getOrderCancelTime());
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
    String sql = "update [Order] set cart_id = ?, customer_id = ?, order_status_id = ?, payment_method_id = ?, contact_phone = ?, delivery_address = ?, order_total = ?, order_time = ?, order_note = ?, delivery_time = ?, order_cancel_time = ? where order_id = ?";
    int result = 0;
    try {
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setInt(1, order.getCartID());
      ps.setInt(2, order.getCustomerID());
      ps.setByte(3, order.getOrderStatusID());
      ps.setByte(4, order.getPaymentMethodID());
      ps.setString(5, order.getContactPhone());
      ps.setString(6, order.getDeliveryAddress());
      ps.setBigDecimal(7, order.getOrderTotal());
      ps.setDate(8, order.getOrderTime());
      ps.setString(9, order.getOrderNote());
      ps.setDate(10, order.getDeliveryTime());
      ps.setDate(11, order.getOrderCancelTime());
      ps.setInt(12, order.getOrderID());
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

  public ResultSet getOrderItems(Order order) {
    int cartID = order.getCartID();
    String sql = "select food_name, food_quantity from Food join CartItem on Food.food_id = CartItem.food_id join Cart on CartItem.cart_id = Cart.cart_id and Cart.cart_id = ?";
    try {
      ps = conn.prepareStatement(sql);
      ps.setInt(1, cartID);
      rs = ps.executeQuery();
      return rs;
    } catch (SQLException ex) {
      Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }

  public List<String> getOrderItemsList(Order order) {
    ResultSet orderItemsRS = this.getOrderItems(order);
    List<String> orderItems = null;
    try {
      orderItems = new ArrayList<>();
      while (orderItemsRS.next()) {
        String foodName = orderItemsRS.getString("food_name");
        short foodQuantity = orderItemsRS.getShort("food_quantity");
        orderItems.add(foodName + " x " + foodQuantity);
      }
    } catch (SQLException ex) {
      Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return orderItems;
  }

  public ResultSet getOrderItems(int cartID) {
    String sql = "select food_name, food_quantity from Food join CartItem on Food.food_id = CartItem.food_id join Cart on CartItem.cart_id = Cart.cart_id and Cart.cart_id = ?";
    try {
      ps = conn.prepareStatement(sql);
      ps.setInt(1, cartID);
      rs = ps.executeQuery();
      return rs;
    } catch (SQLException ex) {
      Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }

  public List<String> getOrderItemsList(int cartID) {
    ResultSet orderItemsRS = this.getOrderItems(cartID);
    List<String> orderItems = null;
    try {
      orderItems = new ArrayList<>();
      while (orderItemsRS.next()) {
        String foodName = orderItemsRS.getString("food_name");
        short foodQuantity = orderItemsRS.getShort("food_quantity");
        orderItems.add(foodName + " x " + foodQuantity);
      }
    } catch (SQLException ex) {
      Logger.getLogger(FoodDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return orderItems;
  }
}
