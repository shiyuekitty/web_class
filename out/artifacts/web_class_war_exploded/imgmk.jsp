<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/23
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
//�����ĸ���
<%@ page import="javax.imageio.*,java.awt.*,java.awt.image.*,java.io.*" pageEncoding="GBK" %>
<%
    //���������
    response.addHeader("expires","0");
    response.addHeader("cache-control","no-cache");
    response.addHeader("Pragram","no-cache");

    //����������������
    out.clear();
    pageContext.pushBody();
    //����һ��ͼƬ
    BufferedImage bimg=new BufferedImage(80,20,BufferedImage.TYPE_INT_RGB);
    //����
    Graphics g=bimg.getGraphics();
    //������ɫ
    g.setColor(Color.black);
    g.fillRect(0,0,80,20);
    g.setColor(Color.yellow);

    String str=""+(1000+(int)(9000*Math.random()));
    session.setAttribute("code",str);
    g.drawString(str,20,15);
    //ͼƬת��Ϊ����������
    ByteArrayOutputStream bout=new ByteArrayOutputStream();
    ImageIO.write(bimg,"jpeg",bout);
    byte[] bb=bout.toByteArray();

    //��ö�����������
    OutputStream outx = response.getOutputStream();

    //����������������������봦������
    response.setContentType("image/jpeg");
    response.addHeader("content-disposition","inline;file=xx.jpg");

    //�����ݷ��ͳ�ȥ
    outx.write(bb,0,bb.length);
    outx.close();

%>

