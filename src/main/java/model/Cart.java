/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class Cart {

    private int card_id;
    private int customer_id;

    public Cart(int card_id, int customer_id) {
        this.card_id = card_id;
        this.customer_id = customer_id;
    }

    public Cart() {
    }

    public int getCart_id() {
        return card_id;
    }

    public void setCart_id(int card_id) {
        this.card_id = card_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

}
