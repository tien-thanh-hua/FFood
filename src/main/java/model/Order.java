/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Hung
 */
public class Order {

    private int order_id;
    private int cart_id;
    private int customer_id;
    private byte order_status_id;
    private byte payment_method_id;
    private Date order_time;
    private double order_total;
    private String order_note;
    private Date delivery_time;
    private String contact_phone;
    private Date order_cancel_time;

    public Order(int order_id, int cart_id, int customer_id, byte order_status_id, byte payment_method_id, Date order_time, double order_total, String order_note, Date delivery_time, String contact_phone, Date order_cancel_time) {
        this.order_id = order_id;
        this.cart_id = cart_id;
        this.customer_id = customer_id;
        this.order_status_id = order_status_id;
        this.payment_method_id = payment_method_id;
        this.order_time = order_time;
        this.order_total = order_total;
        this.order_note = order_note;
        this.delivery_time = delivery_time;
        this.contact_phone = contact_phone;
        this.order_cancel_time = order_cancel_time;
    }

    public Order() {
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public byte getOrder_status_id() {
        return order_status_id;
    }

    public void setOrder_status_id(byte order_status_id) {
        this.order_status_id = order_status_id;
    }

    public byte getPayment_method_id() {
        return payment_method_id;
    }

    public void setPayment_method_id(byte payment_method_id) {
        this.payment_method_id = payment_method_id;
    }

    public Date getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Date order_time) {
        this.order_time = order_time;
    }

    public double getOrder_total() {
        return order_total;
    }

    public void setOrder_total(double order_total) {
        this.order_total = order_total;
    }

    public String getOrder_note() {
        return order_note;
    }

    public void setOrder_note(String order_note) {
        this.order_note = order_note;
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
