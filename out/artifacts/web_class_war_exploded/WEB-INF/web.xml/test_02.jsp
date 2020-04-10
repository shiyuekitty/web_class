<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/2
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*" language="java"  %>
<html>
<head>
    <title>查询结果</title>
</head>
<body>

<%
    String aa=request.getParameter("xpage");
    int xpage=0;
    if (aa==null){
        xpage=1;
    }else {
        xpage=Integer.parseInt(aa);
    }
    int pageSize=20;

    String name=request.getParameter("name");

    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/world";
    String USER = "root";
    String PASS = "password";

    try {
        Class.forName(JDBC_DRIVER);
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        String sql = "SELECT * FROM city";
        PreparedStatement psmt = conn.prepareStatement(sql);
        //psmt.setString(1, name);
        ResultSet rs = psmt.executeQuery();

        for (int i=1;i<=(xpage-1)*pageSize;i++){
            rs.next();
        }

        for (int i=1;i<=pageSize;i++) {
            rs.next();
            int id = rs.getInt(1);
            String name1 = rs.getString(2);
            String countrycode = rs.getString(3);
            String district = rs.getString(4);
            int population = rs.getInt(5);
%>
    <center>
        <table border="1" width="80%" align="center" >
            <tr align="center">
                <td style="width: 20%"><%=id%></td>
                <td style="width: 20%"><%=name1%></td>
                <td style="width: 20%"><%=countrycode%></td>
                <td style="width: 20%"><%=district%></td>
                <td style="width: 20%"><%=population%></td>
            </tr>
        </table>
<%
    }
%>
        <hr width="80%">
        <a href="test_02.jsp?xpage=1">首页</a>
        <a href="test_02.jsp?xpage=<%=xpage-1%>">上一页</a>
        <a href="test_02.jsp?xpage=<%=xpage+1%>">下一页</a>
        <a href="test_02.jsp?xpage=110">尾页</a>
    </center>



<%

    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
