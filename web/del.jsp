<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/21
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 获得id
    String id = request.getParameter("id");

    System.out.println("***********");
    System.out.println("id:"+id);

    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/test";
    String USER = "root";
    String PASS = "password";

    try {
        // 数据库连接
        Class.forName(JDBC_DRIVER);
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        String sql = "DELETE * FROM web_class where id=?";
        PreparedStatement psmt = conn.prepareStatement(sql);

        psmt.setInt(1, Integer.parseInt(id));

        psmt.executeUpdate();
        conn.close();

        response.sendRedirect("test_03.jsp");
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
