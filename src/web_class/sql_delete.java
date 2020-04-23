package web_class;
import java.lang.reflect.Parameter;
import java.sql.*;
import java.util.Random;

public class sql_delete {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/test";

    static final String USER = "root";
    static final String PASS = "password";

    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        PreparedStatement psmt = null;
        String sql = "DELETE FROM web_class where id=1";
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            psmt = conn.prepareStatement(sql);
//            for(int i=0;i<=300;i++){
//                psmt = conn.prepareStatement(sql);
//                psmt.setInt(1,i);
//                int rs = psmt.executeUpdate();
//            }
            int rs = psmt.executeUpdate();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Success");
    }
}