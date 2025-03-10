package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBUtils {
    private static final String DB_NAME = "prj301_1820_workshop1";
    private static final String DB_USERNAME = "sa";
    private static final String DB_PASSWORD= "12345";
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName="+DB_NAME;
        Connection conn = DriverManager.getConnection(url, DB_USERNAME, DB_PASSWORD);
        return conn;
    }
    
    public static void main(String[] args) {
        try {
            Connection conn = getConnection();
            System.out.println(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}