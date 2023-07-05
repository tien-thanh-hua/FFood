/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hung
 */
public class Admin {

    private byte admin_id;
    private String admin_fullname;

    public Admin(byte admin_id, String admin_fullname) {
        this.admin_id = admin_id;
        this.admin_fullname = admin_fullname;
    }

    public Admin() {
    }

    public byte getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(byte admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_fullname() {
        return admin_fullname;
    }

    public void setAdmin_fullname(String admin_fullname) {
        this.admin_fullname = admin_fullname;
    }

}
