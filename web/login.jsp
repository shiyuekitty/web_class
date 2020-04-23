<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/23
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h3>登录系统</h3>
    <form action="loginHeader.jsp">
        <a>用户名：<input type="text" name="name" class="form-control"/></a><br>
        <a>密码：<input type="password" name="password" class="form-control"/></a><br>
        <a>校验码：<input type="text" name="code" size="6"/>
            <img src="imgmk.jsp" width="70px" height="26px"/>
        </a>
        <br>
        <input type="submit" value="登录"/>
        <input type="reset" value="重置"/>
    </form>
</center>
</body>
</html>
