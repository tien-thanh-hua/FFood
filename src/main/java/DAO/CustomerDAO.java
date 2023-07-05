/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author Hung
 */
public class CustomerDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public CustomerDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select*from Customer";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer getCustomer(String gct) {
        Customer ct = null;
        try {
            ps = conn.prepareStatement("select*from Customer where customer_id=?");
            ps.setString(1, gct);
            rs = ps.executeQuery();
            if (rs.next()) {
                ct = new Customer(rs.getInt("customer_id"), rs.getString("customer_firstname"), rs.getString("customer_lastname"), rs.getString("customer_gender"), rs.getString("customer_phone"), rs.getString("customer_address"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ct;
    }

    public int AddNew(Customer act) {
        String sql = "insert into Customer values(?,?,?,?,?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, act.getCustomer_id());
            ps.setString(2, act.getCustomer_firstname());
            ps.setString(3, act.getCustomer_lastname());
            ps.setString(4, act.getCustomer_gender());
            ps.setString(5, act.getCustomer_phone());
            ps.setString(6, act.getCustomer_address());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from Customer where customer_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(Customer uct) {
        String sql = "update Customer set customer_firstname=?, customer_lastname=?, customer_gender=?, customer_phone=?, customer_address=? where customer_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uct.getCustomer_id());
            ps.setString(2, uct.getCustomer_firstname());
            ps.setString(3, uct.getCustomer_lastname());
            ps.setString(4, uct.getCustomer_gender());
            ps.setString(5, uct.getCustomer_phone());
            ps.setString(6, uct.getCustomer_address());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

}
