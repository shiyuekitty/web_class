<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/23
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
//导入四个包
<%@ page import="javax.imageio.*,java.awt.*,java.awt.image.*,java.io.*" pageEncoding="GBK" %>
<%
    //浏览器缓存
    response.addHeader("expires","0");
    response.addHeader("cache-control","no-cache");
    response.addHeader("Pragram","no-cache");

    //清除服务器输出对象
    out.clear();
    pageContext.pushBody();
    //生成一张图片
    BufferedImage bimg=new BufferedImage(80,20,BufferedImage.TYPE_INT_RGB);
    //画笔
    Graphics g=bimg.getGraphics();
    //设置颜色
    g.setColor(Color.black);
    g.fillRect(0,0,80,20);
    g.setColor(Color.yellow);

    String str=""+(1000+(int)(9000*Math.random()));
    session.setAttribute("code",str);
    g.drawString(str,20,15);
    //图片转化为二进制数组
    ByteArrayOutputStream bout=new ByteArrayOutputStream();
    ImageIO.write(bimg,"jpeg",bout);
    byte[] bb=bout.toByteArray();

    //获得二进制数据流
    OutputStream outx = response.getOutputStream();

    //设置浏览器接收数据类型与处置类型
    response.setContentType("image/jpeg");
    response.addHeader("content-disposition","inline;file=xx.jpg");

    //将数据发送出去
    outx.write(bb,0,bb.length);
    outx.close();

%>

