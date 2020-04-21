<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/21
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String course = request.getParameter("course");
    String score = request.getParameter("score");

    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/test";
    String USER = "root";
    String PASS = "password";

    String sql = "INSERT into web_class values(?,?,?,?)";

    try {
        // 数据库连接
        Class.forName(JDBC_DRIVER);
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        PreparedStatement psmt = conn.prepareStatement(sql);

        psmt.setInt(1,Integer.parseInt(id));
        psmt.setString(2,name);
        psmt.setString(3,course);
        psmt.setInt(4,Integer.parseInt(score));

        psmt.executeUpdate();
        conn.close();

        response.sendRedirect("test_03.jsp");

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
