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
import Models.CartItem;

/**
 *
 * @author Hung
 */
public class CartItemDAO {

  private Connection conn;
  private PreparedStatement ps;
  private ResultSet rs;

  public CartItemDAO() {
    conn = DBConnection.DBConnection.getConnection();
  }

//  public ResultSet getAll() {
//    String sql = "select * from CartItem";
//    try {
//      ps = conn.prepareStatement(sql);
//      rs = ps.executeQuery();
//      return rs;
//    } catch (SQLException ex) {
//      Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//    }
//    return null;
//  }
//
//  public CartItem getCartItem(int cartItemID) {
//    CartItem cartItem = null;
//    try {
//      ps = conn.prepareStatement("select * from CartItem where cart_item_id = ?");
//      ps.setInt(1, cartItemID);
//      rs = ps.executeQuery();
//      if (rs.next()) {
//        cartItem = new CartItem(rs.getInt("cart_item_id"), rs.getInt("cart_id"), rs.getShort("food_id"), rs.getBigDecimal("food_price"), rs.getByte("food_quantity"));
//      }
//    } catch (SQLException ex) {
//      Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//    }
//    return cartItem;
//  }
//
//  public int add(CartItem cartItem) {
//    String sql = "insert into CartItem (cart_id, food_id, food_price, food_quantity) values(?, ?, ?, ?)";
//    int result = 0;
//    try {
//      PreparedStatement ps = conn.prepareStatement(sql);
//      ps.setInt(1, cartItem.getCartID());
//      ps.setShort(2, cartItem.getFoodID());
//      ps.setBigDecimal(3, cartItem.getFoodPrice());
//      ps.setByte(4, cartItem.getFoodQuantity());
//      result = ps.executeUpdate();
//    } catch (SQLException ex) {
//      Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//    }
//    return result;
//  }
//
//  public int delete(int id) {
//    int ketqua = 0;
//    String sql = "delete from CartItem where cart_item_id = ?";
//    try {
//      PreparedStatement ps = conn.prepareStatement(sql);
//      ps.setInt(1, id);
//      ketqua = ps.executeUpdate();
//    } catch (SQLException ex) {
//      Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//    }
//    return ketqua;
//  }
//
//  public int update(CartItem cartItem) {
//    String sql = "update CartItem set cart_id = ?, food_id = ?, food_price = ?, food_quantity = ? where cart_item_id = ?";
//    int result = 0;
//    try {
//      PreparedStatement ps = conn.prepareStatement(sql);
//      ps.setInt(1, cartItem.getCartID());
//      ps.setShort(2, cartItem.getFoodID());
//      ps.setBigDecimal(3, cartItem.getFoodPrice());
//      ps.setByte(4, cartItem.getFoodQuantity());
//      ps.setInt(5, cartItem.getCartItemID());
//      result = ps.executeUpdate();
//    } catch (SQLException ex) {
//      Logger.getLogger(CartItemDAO.class.getName()).log(Level.SEVERE, null, ex);
//    }
//    return result;
//  }

}
