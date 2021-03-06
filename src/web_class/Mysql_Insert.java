package web_class;

import java.lang.reflect.Parameter;
import java.sql.*;
import java.util.Random;

public class Mysql_Insert {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/test";

    static final String USER = "root";
    static final String PASS = "password";

    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        PreparedStatement psmt = null;
        Random r = new Random();
        String a[] = {"语文", "数学", "英语"};
        String sql = "INSERT INTO web_class(id,name,course,score) VALUES (?,?,?,?)";
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            for (int i = 0; i <= 500; i++) {
                psmt = conn.prepareStatement(sql);
                psmt.setInt(1, i);
                psmt.setString(2, "Trump" + i);
                psmt.setString(3, a[r.nextInt(3)]);
                psmt.setInt(4, r.nextInt(100));
                int rs = psmt.executeUpdate();
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Success");
    }
}