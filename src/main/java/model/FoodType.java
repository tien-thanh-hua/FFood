/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class FoodType {

    private byte food_type_id;
    private String food_type;

    public FoodType(byte food_type_id, String food_type) {
        this.food_type_id = food_type_id;
        this.food_type = food_type;
    }

    public FoodType() {
    }

    public byte getFood_type_id() {
        return food_type_id;
    }

    public void setFood_type_id(byte food_type_id) {
        this.food_type_id = food_type_id;
    }

    public String getFood_type() {
        return food_type;
    }

    public void setFood_type(String food_type) {
        this.food_type = food_type;
    }

}
