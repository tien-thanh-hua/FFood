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
import model.Account;

/**
 *
 * @author Hung
 */
public class AccountDAO {

    private Connection conn;

    public AccountDAO() {
        conn = DBConnection.dbconnection.getConnection();
    }

    public boolean Login(Account ac) throws SQLException {
        ResultSet rs = null;
        String sql = "select * from Account where account_email=? and account_password=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, ac.getAccount_email());
            ps.setString(2, String.valueOf(ac.getAccount_password()));
            rs = ps.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs.next();
    }
}
