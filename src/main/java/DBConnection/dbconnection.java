/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CE171454 Hua Tien Thanh
 */
public class DBConnection {
    private static Connection conn = null;
    public static Connection getConnection() {

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try {
                conn = DriverManager.getConnection("jdbc:sqlserver://"
                        + "DESKTOP-TP318V1\\SQLEXPRESS:1433;"
                        + "databaseName=lab01;"
                        + "user=sa;"
                        + "password=admin123;"
                        + "encrypt=true;"
                        + "trustServerCertificate= true;");
            } catch (SQLException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
         return conn;   
    }
  

}