/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.math.BigDecimal;

/**
 *
 * @author Hung
 */
public class CartItem {

  private int cartItemID;
  private int cartID;
  private short foodID;
  private BigDecimal foodPrice;
  private byte foodQuantity;

  public CartItem(int cartItemID, int cartID, short foodID, BigDecimal foodPrice, byte food_quantity) {
    this.cartItemID = cartItemID;
    this.cartID = cartID;
    this.foodID = foodID;
    this.foodPrice = foodPrice;
    this.foodQuantity = food_quantity;
  }

  public CartItem() {
  }

  public int getCartItemID() {
    return cartItemID;
  }

  public void setCartItemID(int cartItemID) {
    this.cartItemID = cartItemID;
  }

  public int getCartID() {
    return cartID;
  }

  public void setCartID(int cartID) {
    this.cartID = cartID;
  }

  public short getFoodID() {
    return foodID;
  }

  public void setFoodID(short foodID) {
    this.foodID = foodID;
  }

  public BigDecimal getFoodPrice() {
    return foodPrice;
  }

  public void setFoodPrice(BigDecimal foodPrice) {
    this.foodPrice = foodPrice;
  }

  public byte getFoodQuantity() {
    return foodQuantity;
  }

  public void setFoodQuantity(byte foodQuantity) {
    this.foodQuantity = foodQuantity;
  }

}
