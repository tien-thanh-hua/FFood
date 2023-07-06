/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.math.BigDecimal;
import java.math.BigInteger;

/**
 *
 * @author Hung
 */
public class Cart {

  private int cartID;
  private int customerID;
  private BigDecimal cartTotal = new BigDecimal(BigInteger.ZERO);

  public Cart(int cartID, int customerID) {
    this.cartID = cartID;
    this.customerID = customerID;
  }

  public Cart() {
  }

  public int getCartID() {
    return cartID;
  }

  public void setCartID(int cartID) {
    this.cartID = cartID;
  }

  public int getCustomerID() {
    return customerID;
  }

  public void setCustomerID(int customerID) {
    this.customerID = customerID;
  }

  public BigDecimal getCartTotal() {
    return cartTotal;
  }

  public void setCartTotal(BigDecimal cartTotal) {
    this.cartTotal = cartTotal;
  }

}
