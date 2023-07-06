/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import Models.Account;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hung
 */
public class AccountDAO {

  private Connection conn;
  private PreparedStatement ps;
  private ResultSet rs;

  public AccountDAO() {
    conn = DBConnection.DBConnection.getConnection();
  }

  public int add(Account account) {
    int result = 0;
    try {
      if (account.getAccountType().equals("user")) {
        // Account is of User type (no adminID)
        String sql = "insert into Account (customer_id, account_username, account_email, account_password, account_type) values (?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, account.getCustomerID());
        ps.setString(2, account.getUsername());
        ps.setString(3, account.getEmail());
        ps.setString(4, account.getPassword());
        ps.setString(5, account.getAccountType());
        result = ps.executeUpdate();
      } else {
        //  Account is of Admin type (no customerID)
        String sql = "insert into Account (admin_id, account_username, account_email, account_password, account_type) values (?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setByte(1, account.getAdminID());
        ps.setString(2, account.getUsername());
        ps.setString(3, account.getEmail());
        ps.setString(4, account.getPassword());
        ps.setString(5, account.getAccountType());
        result = ps.executeUpdate();
      }

    } catch (SQLException ex) {
      Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return result;
  }

  public int update(Account account) {
    String sql = "update Account set account_username = ?, account_password = ? where account_id = ?";
    int result = 0;
    try {
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setString(1, account.getUsername());
      ps.setString(2, account.getPassword());
      ps.setInt(3, account.getAccountID());
      result = ps.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return result;
  }

  public int delete(int id) {
    int result = 0;
    String sql = "delete from Account where account_id = ?";
    try {
      PreparedStatement ps = conn.prepareStatement(sql);
      ps.setInt(1, id);
      result = ps.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return result;
  }

  public List<Account> getAll() {
    try {
      List<Account> accountList = new ArrayList<>();
      ps = conn.prepareStatement("select * from Account");
      rs = ps.executeQuery();
      while (rs.next()) {
        Account account;
        if (rs.getString("account_type").equals("User")) {
          // Account is of User type (no adminID)
          account = new Account(rs.getInt("account_id"),
                  rs.getInt("customer_id"),
                  rs.getString("account_username"),
                  rs.getString("account_email"),
                  rs.getString("account_password"),
                  rs.getString("account_type"));
        } else {
          //  Account is of Admin type (no customerID)
          account = new Account(rs.getInt("account_id"),
                  rs.getByte("admin_id"),
                  rs.getString("account_username"),
                  rs.getString("account_email"),
                  rs.getString("account_password"),
                  rs.getString("account_type"));
        }
        accountList.add(account);
      }
      return accountList;
    } catch (SQLException ex) {
      Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }

  public List<Account> getAllUser() {
    try {
      List<Account> accountList = new ArrayList<>();
      ps = conn.prepareStatement("select * from Account where account_type = 'User'");
      rs = ps.executeQuery();
      while (rs.next()) {
        Account account = new Account(rs.getInt("account_id"),
                rs.getInt("customer_id"),
                rs.getString("account_username"),
                rs.getString("account_email"),
                rs.getString("account_password"),
                rs.getString("account_type"));
        accountList.add(account);
      }
      return accountList;
    } catch (SQLException ex) {
      Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }

  public List<Account> getAllAdmin() {
    try {
      List<Account> accountList = new ArrayList<>();
      ps = conn.prepareStatement("select * from Account where account_type = 'Admin'");
      rs = ps.executeQuery();
      while (rs.next()) {
        Account account = new Account(rs.getInt("account_id"),
                rs.getByte("admin_id"),
                rs.getString("account_username"),
                rs.getString("account_email"),
                rs.getString("account_password"),
                rs.getString("account_type"));
        accountList.add(account);
      }
      return accountList;
    } catch (SQLException ex) {
      Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }

  public Account getAccount(String email) {
    Account acc = null;
    try {
      ps = conn.prepareStatement("select * from Account where account_email = ?");
      ps.setString(1, email);
      rs = ps.executeQuery();
      if (rs.next()) {
        if (rs.getString("account_type").equals("User")) {
          // Account is of User type (no adminID)
          acc = new Account(rs.getInt("account_id"),
                  rs.getInt("customer_id"),
                  rs.getString("account_username"),
                  rs.getString("account_email"),
                  rs.getString("account_password"),
                  rs.getString("account_type"));
        } else {
          //  Account is of Admin type (no customerID)
          acc = new Account(rs.getInt("account_id"),
                  rs.getByte("admin_id"),
                  rs.getString("account_username"),
                  rs.getString("account_email"),
                  rs.getString("account_password"),
                  rs.getString("account_type"));
        }
      }
      return acc;
    } catch (SQLException ex) {
      Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }

  public boolean login(Account acc) throws SQLException {
    rs = null;
    String sql = "select * from Account where account_username = ? and account_password = ?";
    try {
      ps = conn.prepareStatement(sql);
      ps.setString(1, acc.getUsername());
      ps.setString(2, acc.getPassword());
      rs = ps.executeQuery();
    } catch (SQLException ex) {
      Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return rs.next();
  }
}
