/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class Food {

    private short food_id;
    private String food_name;
    private double food_price;
    private byte discount_percent;
    private String food_img_url;
    private byte food_type_id;

    public Food(short food_id, String food_name, double food_price, byte discount_percent, String food_img_url, byte food_type_id) {
        this.food_id = food_id;
        this.food_name = food_name;
        this.food_price = food_price;
        this.discount_percent = discount_percent;
        this.food_img_url = food_img_url;
        this.food_type_id = food_type_id;
    }

    public Food() {
    }

    public short getFood_id() {
        return food_id;
    }

    public void setFood_id(short food_id) {
        this.food_id = food_id;
    }

    public String getFood_name() {
        return food_name;
    }

    public void setFood_name(String food_name) {
        this.food_name = food_name;
    }

    public double getFood_price() {
        return food_price;
    }

    public void setFood_price(double food_price) {
        this.food_price = food_price;
    }

    public byte getDiscount_percent() {
        return discount_percent;
    }

    public void setDiscount_percent(byte discount_percent) {
        this.discount_percent = discount_percent;
    }

    public String getFood_img_url() {
        return food_img_url;
    }

    public void setFood_img_url(String food_img_url) {
        this.food_img_url = food_img_url;
    }

    public byte getFood_type_id() {
        return food_type_id;
    }

    public void setFood_type_id(byte food_type_id) {
        this.food_type_id = food_type_id;
    }

}
