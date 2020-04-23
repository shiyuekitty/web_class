<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/23
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>fail</title>
</head>
<body>
<h3>登录失败，请重新<a href="login.jsp">登录</a>三秒后自动跳转</h3>
</body>
</html>
<%
    response.setHeader("refresh","3;login.jsp");
%>