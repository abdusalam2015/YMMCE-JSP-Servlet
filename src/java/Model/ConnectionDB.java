package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 * @author abdussalam
 */
public class ConnectionDB {

    public static final String url = "jdbc:mysql://localhost:3306/mydatabase";
    public static final String user = "root";
    public static final String password = "root";
    public static final String unicode = "";
    
     /*public static final String url = "jdbc:mysql://97.74.232.210:3306/ymmce_mydatabase";
     public static final String user = "ymmce_abdussalam";
     public static final String password = "YMaz100962946$";
     public static final String unicode = "?useUnicode=yes&characterEncoding=UTF-8";
    */ 
    Statement stmt = null;

    public ConnectionDB() {
        System.out.println("Here!!!!!!!!!");
    }

    public Connection connect() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url + unicode, user, password);
            System.out.println("connected sucesesfully!");
            return con;
        } catch (Exception e) {
            System.out.println("Faild Connection!");
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {

    }
}
