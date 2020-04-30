<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/30
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name=request.getParameter("name");
    String address=request.getParameter("address");
    String phone=request.getParameter("phone");

    byte[] bb=name.getBytes();

    String str1=new String(bb,"GBK");

    InputStream in=request.getInputStream();
    byte[] bb=new byte[1024];
    File f=new File("D:\\dd.txt");

    FileOutputStream fout=new FileOutputStream(f);
    int length=-1;
    length=in.read(bb);
    while (length!=-1){
        fout.write(bb,0,length);

    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
