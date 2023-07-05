/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class PaymentMethod {

    private byte payment_method_id;
    private String payment_method;

    public PaymentMethod(byte payment_method_id, String payment_method) {
        this.payment_method_id = payment_method_id;
        this.payment_method = payment_method;
    }

    public PaymentMethod() {
    }

    public byte getPayment_method_id() {
        return payment_method_id;
    }

    public void setPayment_method_id(byte payment_method_id) {
        this.payment_method_id = payment_method_id;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

}
