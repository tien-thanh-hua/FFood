/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class CartItem {

    private int cart_item_id;
    private int cart_id;
    private short food_id;
    private double food_price;
    private byte food_quantity;

    public CartItem(int cart_item_id, int cart_id, short food_id, double food_price, byte food_quantity) {
        this.cart_item_id = cart_item_id;
        this.cart_id = cart_id;
        this.food_id = food_id;
        this.food_price = food_price;
        this.food_quantity = food_quantity;
    }

    public CartItem() {
    }

    public int getCart_item_id() {
        return cart_item_id;
    }

    public void setCart_item_id(int cart_item_id) {
        this.cart_item_id = cart_item_id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public short getFood_id() {
        return food_id;
    }

    public void setFood_id(short food_id) {
        this.food_id = food_id;
    }

    public double getFood_price() {
        return food_price;
    }

    public void setFood_price(double food_price) {
        this.food_price = food_price;
    }

    public byte getFood_quantity() {
        return food_quantity;
    }

    public void setFood_quantity(byte food_quantity) {
        this.food_quantity = food_quantity;
    }

}
