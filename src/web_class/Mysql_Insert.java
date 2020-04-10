package web_class;
import java.sql.*;
public class Mysql_Insert {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/test";

    static final String USER = "root";
    static final String PASS = "password";

    public static void main(String[] args) throws SQLException {
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            String sql;
            sql = "INSERT INTO web_class(id,name,course,score) VALUES (2,'赵玉鑫','math',0)";
//            sql = "DELETE FROM web_class where id=2";
            int rs = stmt.executeUpdate(sql);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Success");
        conn.close();

    }
}
