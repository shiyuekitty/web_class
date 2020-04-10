package Example10_9;
import java.sql.*;
public class ReadExaminationPaper {
    private String sourseName,tableName;
    ReadExaminationPaper(){
        try {
            Class.forName("sun.jdbc.odbc.Jdb0dbcDriver");
        }catch (ClassNotFoundException e){
            System.out.println(e);
        }
    }
    int getAmount(){
        Connection con;
        Statement sql;
        ResultSet rs;
        try {
            String uri="jdbc:odbc:"+sourseName;
            String id="";
            String password="";
            con=DriverManager.getConnection(uri,id,password);
            sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            rs=sql.executeQuery("SELECT * FROM "+tableName);
            rs.last();
            int rows=rs.getRow();
            return rows;
        }catch(SQLException exp){
            System.out.println(""+exp);
            return 0;
        }
    }
    String[] getExamQuestion(int number){
        Connection con;
        Statement sql;
        ResultSet rs;
        String[] examinatinPaper=new String[6];
        try {
            String uri="jdbc:mysql://127.0.0.1:3306/webstore?&useSSL=false&serverTimezone=UTC";
            String id="";
            String password="";
            con=DriverManager.getConnection(uri,id,password);
            sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            rs=sql.executeQuery("SELECT * FROM testForm");
            rs.absolute(number);
//            examinatinPaper[0]=rs.getString(1);
//            examinatinPaper[1]=rs.getString(2);
//            examinatinPaper[2]=rs.getString(3);
//            examinatinPaper[3]=rs.getString(4);
//            examinatinPaper[4]=rs.getString(5);
//            examinatinPaper[5]=rs.getString(6);
            con.close();
        }catch (SQLException e){
            System.out.println("无法获得试题"+e);
        }
        return examinatinPaper;
    }

    void setSoursName(String s) {
        sourseName=s;
    }

    public void setTableName(String s) {
        tableName=s;
    }
}
