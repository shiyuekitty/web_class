<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>

<html>
<head>

    <title>查询页面</title>

</head>
<body>

<center>
    <br>
    <br>
    <br>
    <form>
        <a style="font-size: 40px">请输入要查询的姓名：</a>
        <label>
            <input type="text" name="name"/>
        </label>
        <input type="submit" value="  查询  "/>

    </form>
    <hr border="1">
</center>
<%
    String name=request.getParameter("name");

    if (name==null){

        return;
    }
    String name2=new String(name.getBytes());


    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/test";
    String USER = "root";
    String PASS = "password";

    try {
        Class.forName(JDBC_DRIVER);
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        String sql = "SELECT * FROM web_class WHERE name=?";
        PreparedStatement psmt = conn.prepareStatement(sql);
        psmt.setString(1, name);
        ResultSet rs = psmt.executeQuery();

        if(rs.next()) {
            int id = rs.getInt(1);
            String name1 = rs.getString(2);
            String course = rs.getString(3);
            int score = rs.getInt(4);
%>
            <table border="1" width="80%" align="center" >
            <tr align="center">
                <td style="width: 20%"><%=id%></td>
                <td style="width: 20%"><%=name1%></td>
                <td style="width: 20%"><%=course%></td>
                <td style="width: 20%"><%=score%></td>

            </tr>
            </table>
<%
        }else {
%>
<center>
    <table border="1" width="80%">
        <tr align="center">
            <td>没有数据......</td>
        </tr>
    </table>
</center>
<%}%>
    <%

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>


</body>
</html>