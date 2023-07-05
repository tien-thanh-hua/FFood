/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class OrderStatus {

    private byte order_status_id;
    private String order_status;

    public OrderStatus(byte order_status_id, String order_status) {
        this.order_status_id = order_status_id;
        this.order_status = order_status;
    }

    public OrderStatus() {
    }

    public byte getOrder_status_id() {
        return order_status_id;
    }

    public void setOrder_status_id(byte order_status_id) {
        this.order_status_id = order_status_id;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

}
