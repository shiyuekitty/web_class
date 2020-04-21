<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/21
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/test";
    String USER = "root";
    String PASS = "password";

    String sql = "SELECT max(id) FROM web_class ";

    try {
        // 数据库连接
        Class.forName(JDBC_DRIVER);
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        PreparedStatement psmt = conn.prepareStatement(sql);

        ResultSet rs = psmt.executeQuery();
        rs.next();
        int id=rs.getInt(1)+1;
        conn.close();

        response.sendRedirect("test_03.jsp");
%>
<html>
<head>
    <title>添加信息</title>
</head>
<body>
<center>
<a>学生信息添加</a>
<hr>
<form>
    <a>学号：<input type="text" value="<%=id%>" /></a>
    <a>姓名：<input type="text" name="name" /></a>
    <a>科目：<select name="course" >
        <option>语文</option>
        <option>数学</option>
        <option>英语</option>
    </select></a>
    <a>成绩：<input type="text" name="score" /></a>
    <input type="submit" value="添加信息" />
</form>
</center>
<%
    } catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
    }
%>
</body>
</html>
