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
import model.PaymentMethod;

/**
 *
 * @author Hung
 */
public class PaymentMethodDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public PaymentMethodDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public ResultSet getAll() {
        String sql = "select*from PaymentMethod";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(PaymentMethodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public PaymentMethod getPaymentMethod(String gpmt) {
        PaymentMethod pmt = null;
        try {
            ps = conn.prepareStatement("select*from PaymentMethod where payment_method_id=?");
            ps.setString(1, gpmt);
            rs = ps.executeQuery();
            if (rs.next()) {
                pmt = new PaymentMethod(rs.getByte("payment_method_id"), rs.getString("payment_method"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(PaymentMethodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pmt;
    }

    public int AddNew(PaymentMethod apmt) {
        String sql = "insert into PaymentMethod values(?,?)";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setByte(1, apmt.getPayment_method_id());
            ps.setString(2, apmt.getPayment_method());
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PaymentMethodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Delete(String id) {
        int ketqua = 0;
        String sql = "delete from PaymentMethod where payment_method_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ketqua = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PaymentMethodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }

    public int Update(PaymentMethod upmt) {
        String sql = "update PaymentMethod set payment_method=? where payment_method_id=?";
        int ketqua = 0;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setByte(1, upmt.getPayment_method_id());
            ps.setString(2, upmt.getPayment_method());
        } catch (SQLException ex) {
            Logger.getLogger(PaymentMethodDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ketqua;
    }
}
