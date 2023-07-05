/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class AdminFood {

    private byte admin_id;
    private short food_id;

    public AdminFood(byte admin_id, short food_id) {
        this.admin_id = admin_id;
        this.food_id = food_id;
    }

    public AdminFood() {
    }

    public byte getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(byte admin_id) {
        this.admin_id = admin_id;
    }

    public short getFood_id() {
        return food_id;
    }

    public void setFood_id(short food_id) {
        this.food_id = food_id;
    }

}
