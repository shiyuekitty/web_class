<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/23
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //判断校验码
    String code=request.getParameter("code");
    //判断验证码是否一致
    String imgcode=(String)session.getAttribute("code");

    if (imgcode==null||!code.equals(imgcode)){
        out.print("校验码错误，2秒返回登录页面");
        response.setHeader("refresh","2;login.jsp");
        return;
    }

    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/test";
    String USER = "root";
    String PASS = "password";

    String name=request.getParameter("name");
    String password=request.getParameter("password");

    String sql="SELECT * FROM login WHERE name=? and password=?";
    try {
        // 数据库连接
        Class.forName(JDBC_DRIVER);
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

        PreparedStatement psmt = conn.prepareStatement(sql);
        psmt.setString(1,name);
        psmt.setString(2,password);

        System.out.println(name);


        ResultSet rs=psmt.executeQuery();

        if (rs.next()){
            //验证令牌
            session.setAttribute("passcard","ok3");
            //转到成功页面
            response.sendRedirect("3.jsp");

        }else {
            //转到失败页面
            response.sendRedirect("fail.jsp");
        }

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>

