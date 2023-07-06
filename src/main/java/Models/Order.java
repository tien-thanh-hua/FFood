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
  private byte paymentMethodID;
  private Date orderTime;
  private BigDecimal orderTotal = new BigDecimal(BigInteger.ZERO);
  private String orderNote;
  private Date delivery_time;
  private String contact_phone;
  private Date order_cancel_time;

  public Order() {
  }

  public Order(int orderID, int cartID, int customerID, byte orderStatusID, byte paymentMethodID, Date orderTime, String orderNote, Date delivery_time, String contact_phone, Date order_cancel_time) {
    this.orderID = orderID;
    this.cartID = cartID;
    this.customerID = customerID;
    this.orderStatusID = orderStatusID;
    this.paymentMethodID = paymentMethodID;
    this.orderTime = orderTime;
    this.orderNote = orderNote;
    this.delivery_time = delivery_time;
    this.contact_phone = contact_phone;
    this.order_cancel_time = order_cancel_time;
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

  public Date getDelivery_time() {
    return delivery_time;
  }

  public void setDelivery_time(Date delivery_time) {
    this.delivery_time = delivery_time;
  }

  public String getContact_phone() {
    return contact_phone;
  }

  public void setContact_phone(String contact_phone) {
    this.contact_phone = contact_phone;
  }

  public Date getOrder_cancel_time() {
    return order_cancel_time;
  }

  public void setOrder_cancel_time(Date order_cancel_time) {
    this.order_cancel_time = order_cancel_time;
  }

}
