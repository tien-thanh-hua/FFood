/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;

/**
 *
 * @author Hung
 */
public class Order {

  private int orderID;
  private int cartID;
  private int customerID;
  private byte orderStatusID;
  private String orderStatus;
  private byte paymentMethodID;
  private String paymentMethod;
  private Date orderTime;
  private BigDecimal orderTotal = new BigDecimal(BigInteger.ZERO);
  private String orderNote;
  private Date deliveryTime;
  private String contactPhone;
  private Date orderCancelTime;

  public Order() {
  }

  public Order(int orderID, int cartID, int customerID, byte orderStatusID, byte paymentMethodID, Date orderTime, String orderNote, Date deliveryTime, String contactPhone, Date orderCancelTime) {
    this.orderID = orderID;
    this.cartID = cartID;
    this.customerID = customerID;
    this.orderStatusID = orderStatusID;
    this.paymentMethodID = paymentMethodID;
    this.orderTime = orderTime;
    this.orderNote = orderNote;
    this.deliveryTime = deliveryTime;
    this.contactPhone = contactPhone;
    this.orderCancelTime = orderCancelTime;
  }

  public Order(int orderID, int cartID, int customerID, byte orderStatusID, byte paymentMethodID, Date orderTime, BigDecimal orderTotal, String orderNote, Date deliveryTime, String contactPhone, Date orderCancelTime) {
    this.orderID = orderID;
    this.cartID = cartID;
    this.customerID = customerID;
    this.orderStatusID = orderStatusID;
    this.paymentMethodID = paymentMethodID;
    this.orderTime = orderTime;
    this.orderTotal = orderTotal;
    this.orderNote = orderNote;
    this.deliveryTime = deliveryTime;
    this.contactPhone = contactPhone;
    this.orderCancelTime = orderCancelTime;
  }
  
  public Order(int orderID, int cartID, int customerID, byte orderStatusID, String orderStatus, byte paymentMethodID, String paymentMethod, Date orderTime, BigDecimal orderTotal, String orderNote, Date deliveryTime, String contactPhone, Date orderCancelTime) {
    this.orderID = orderID;
    this.cartID = cartID;
    this.customerID = customerID;
    this.orderStatusID = orderStatusID;
    this.orderStatus = orderStatus;
    this.paymentMethodID = paymentMethodID;
    this.paymentMethod = paymentMethod;
    this.orderTime = orderTime;
    this.orderTotal = orderTotal;
    this.orderNote = orderNote;
    this.deliveryTime = deliveryTime;
    this.contactPhone = contactPhone;
    this.orderCancelTime = orderCancelTime;
  }

  public int getOrderID() {
    return orderID;
  }

  public void setOrderID(int orderID) {
    this.orderID = orderID;
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

  public byte getOrderStatusID() {
    return orderStatusID;
  }

  public void setOrderStatusID(byte orderStatusID) {
    this.orderStatusID = orderStatusID;
  }

  public byte getPaymentMethodID() {
    return paymentMethodID;
  }

  public void setPaymentMethodID(byte paymentMethodID) {
    this.paymentMethodID = paymentMethodID;
  }

  public String getPaymentMethod() {
    return paymentMethod;
  }

  public void setPaymentMethod(String paymentMethod) {
    this.paymentMethod = paymentMethod;
  }

  public Date getOrderTime() {
    return orderTime;
  }

  public void setOrderTime(Date orderTime) {
    this.orderTime = orderTime;
  }

  public BigDecimal getOrderTotal() {
    return orderTotal;
  }

  public void setOrderTotal(BigDecimal orderTotal) {
    this.orderTotal = orderTotal;
  }

  public String getOrderNote() {
    return orderNote;
  }

  public void setOrderNote(String orderNote) {
    this.orderNote = orderNote;
  }

  public Date getDeliveryTime() {
    return deliveryTime;
  }

  public void setDeliveryTime(Date deliveryTime) {
    this.deliveryTime = deliveryTime;
  }

  public String getContactPhone() {
    return contactPhone;
  }

  public void setContactPhone(String contactPhone) {
    this.contactPhone = contactPhone;
  }

  public Date getOrderCancelTime() {
    return orderCancelTime;
  }

  public void setOrderCancelTime(Date orderCancelTime) {
    this.orderCancelTime = orderCancelTime;
  }

}
