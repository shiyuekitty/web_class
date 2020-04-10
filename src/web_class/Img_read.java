package web_class;
import java.sql.*;
import java.io.*;
public class Img_read {
    static final String JDBC_DRIVER="com.mysql.jdbc.Driver";
    static final String DB_URL="jdbc:mysql://localhost:3306/test";
    static final String USER="root";
    static final String PASS="password";

    public static void main(String[] args) {
        try {
            Class.forName(JDBC_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String sql = "SELECT * from web_class WHERE id=2";

            PreparedStatement psmt = conn.prepareStatement(sql);
            ResultSet rs=psmt.executeQuery();
            rs.next();
            int id=rs.getInt(1);
            String name=rs.getString(2);
            String course=rs.getString(3);
            int score=rs.getInt(4);
            InputStream in = rs.getBinaryStream(5);

            File f=new File(".\\oupput.jpg");
            FileOutputStream fout=new FileOutputStream(f);

            byte [] bb=new byte[10];
            int length=in.read(bb);
            while (length!=-1){
                fout.write(bb,0,length);
                length=in.read(bb);
            }
            in.close();
            fout.close();
            conn.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
