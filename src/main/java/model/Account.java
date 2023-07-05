/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class Account {

    private int account_id;
    private int customer_id;
    private byte admin_id;
    private String account_username;
    private String account_email;
    private String account_password;
    private String account_type;

    public Account(int account_id, int customer_id, byte admin_id, String account_username, String account_email, String account_password, String account_type) {
        this.account_id = account_id;
        this.customer_id = customer_id;
        this.admin_id = admin_id;
        this.account_username = account_username;
        this.account_email = account_email;
        this.account_password = account_password;
        this.account_type = account_type;
    }

    public Account() {
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public byte getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(byte admin_id) {
        this.admin_id = admin_id;
    }

    public String getAccount_username() {
        return account_username;
    }

    public void setAccount_username(String account_username) {
        this.account_username = account_username;
    }

    public String getAccount_email() {
        return account_email;
    }

    public void setAccount_email(String account_email) {
        this.account_email = account_email;
    }

    public String getAccount_password() {
        return account_password;
    }

    public void setAccount_password(String account_password) {
        this.account_password = account_password;
    }

    public String getAccount_type() {
        return account_type;
    }

    public void setAccount_type(String account_type) {
        this.account_type = account_type;
    }

}
