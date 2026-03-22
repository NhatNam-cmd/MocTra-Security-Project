package backend.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    private static String url = "jdbc:mysql://127.0.0.1:3306/moctra_db?useUnicode=true&characterEncoding=utf-8&connectTimeout=3000";
    private static String user = "root";
    private static String password = "";

    public static Connection getConnection() {

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return  conn;
    }
    public static void main(String[] args) {
        System.out.println("Đang thử kết nối đến MySQL...");
        Connection conn = getConnection();
        if (conn != null) {
            System.out.println("✅ Kết nối thành công tới database: moctra_db!");
        } else {
            System.out.println("❌ Kết nối thất bại!");
        }
    }

}



