<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/28
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*"  %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 1、得到二进制流
    OutputStream outx=response.getOutputStream();

    // 2、设置头，告知浏览器需要下载
    response.setContentType("application/x-download");

    // 3、告诉浏览器接收文件是下载还是打开
    response.addHeader("Content-Disposition","attachment;filename=test.mp4");

    // 4、通过二进制流，将文件的数据发送到客户端
    FileInputStream fin=new FileInputStream("E:\\software\\apache-tomcat-9.0.33-windows-x64\\apache-tomcat-9.0.33\\webapps\\test\\test.mp4");
    byte[] bb=new byte[1024];
    int length=-1;
    length=fin.read(bb);

    while (length!=-1){
        outx.write(bb,0,length);
        length=fin.read(bb);
    }
//     5、关闭流对象
    outx.close();
%>