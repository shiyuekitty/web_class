package web_class;

import java.sql.*;
import java.io.*;

public class Img_write {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/test";

    static final String USER = "root";
    static final String PASS = "password";

    public static void main(String[] args) throws FileNotFoundException {
        File f = new File("E:\\projects\\pyprogram_text\\Intellij_Code\\src\\Trump.jpg");
        FileInputStream fin = new FileInputStream(f);
        try {
            Class.forName(JDBC_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String sql = "INSERT INTO web_class(id,name,course,score,img) value(?,?,?,?,?)";

            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, 2);
            psmt.setString(2, "Trump");
            psmt.setString(3, "math");
            psmt.setInt(4,0);
            psmt.setBinaryStream(5, fin,(int)f.length());

            int rs = psmt.executeUpdate();
            System.out.println("Success");
            conn.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
