<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/10
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    int totalpages = 0;
    int pageSize = 20;
    int totalRecords = 0;
    int xpage = 1;
%>
<%
    String JDBC_DRIVER="com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/world";
    String USER = "root";
    String PASS = "password";

    try {
        Class.forName(JDBC_DRIVER);
        Connection conn=DriverManager.getConnection(DB_URL,USER,PASS);
        String sql = "SELECT count(*) FROM city";
        PreparedStatement psmt = conn.prepareStatement(sql);
        ResultSet rs = psmt.executeQuery();

        rs.next();
        totalRecords=rs.getInt(1);
        String aa=request.getParameter("page");
        if (aa==null){
            xpage=1;
        }else {
            try {
                xpage=Integer.parseInt(aa);
            }catch (NumberFormatException e){
                xpage=1;
            }
        }
        if (xpage<1){
            xpage=1;
        }
        pageSize=20;
        if (totalRecords%pageSize==0){
            totalpages=totalRecords/pageSize;
        }else {
            totalpages=totalRecords/pageSize+1;
        }
        totalpages=(totalRecords+pageSize-1)/pageSize;

        //显示当前数据
        sql="SELECT * FROM city";
        psmt=conn.prepareStatement(sql);
        rs=psmt.executeQuery();

        if (xpage>=totalpages){
            for (int i=1;i<=(totalpages-1)*pageSize;i++){
                rs.next();
            }
        }else {
            for (int i=1;i<=(xpage-1)*pageSize;i++){
                rs.next();
            }
        }
    %>
<html>
<head>
    <title>仿百度页面的分页显示</title>
</head>
<body>
<center>
    <h3>世界城市人口数据</h3>
    <hr width="80%">
    <table border="1" width="80%" align="center">
        <%
            for (int i=1;i<=pageSize;i++){
                if (!rs.next()) {
                    break;
                }
                int id = rs.getInt(1);
                String name1 = rs.getString(2);
                String countrycode = rs.getString(3);
                String district = rs.getString(4);
                int population = rs.getInt(5);
        %>
        <tr align="center">
            <td style="width: 20%"><%=id%>
            </td>
            <td style="width: 20%"><%=name1%>
            </td>
            <td style="width: 20%"><%=countrycode%>
            </td>
            <td style="width: 20%"><%=district%>
            </td>
            <td style="width: 20%"><%=population%>
            </td>
        </tr>
        <%}%>
    </table>
    <hr>
    <%
        if(xpage<=6){
            if (xpage==1){
                out.print("首页");
                out.print("&nbsp");
                out.print("&nbsp");
                for (int i = 1; i <= 10; i++) {
                    out.println("<a href=test_04.jsp?page=" + i + ">" + i + "</a>");
                    out.print("&nbsp");
                    out.print("&nbsp");
                }
                out.print("&nbsp");
                out.print("&nbsp");
                out.print("<a href=test_04.jsp?page=" + totalpages + ">尾页</a>");
            }else {
                out.print("<a href=test_04.jsp?page=1>首页</a>");
                out.print("&nbsp");
                out.print("&nbsp");
                for (int i = 1; i <= 10; i++) {
                    out.println("<a href=test_04.jsp?page=" + i + ">" + i + "</a>");
                    out.print("&nbsp");
                    out.print("&nbsp");
                }
                out.print("&nbsp");
                out.print("&nbsp");
                out.print("<a href=test_04.jsp?page=" + totalpages + ">尾页</a>");
            }
        } else{
            if (xpage==totalpages) {
                out.print("<a href=test_04.jsp?page=1>首页</a>");
                out.print("&nbsp");
                out.print("&nbsp");
                for (int i = xpage - 5; i <= xpage + 4; i++) {
                    out.println("<a href=test_04.jsp?page=" + i + ">" + i + "</a>");
                    out.print("&nbsp");
                    out.print("&nbsp");
                }
                out.print("&nbsp");
                out.print("&nbsp");
                out.print("尾页");
            }else {
                out.print("<a href=test_04.jsp?page=1>首页</a>");
                out.print("&nbsp");
                out.print("&nbsp");
                for (int i = xpage - 5; i <= xpage + 4; i++) {
                    out.println("<a href=test_04.jsp?page=" + i + ">" + i + "</a>");
                    out.print("&nbsp");
                    out.print("&nbsp");
                }
                out.print("&nbsp");
                out.print("&nbsp");
                out.print("<a href=test_04.jsp?page=" + totalpages + ">尾页</a>");
            }
        }
    %>
</center>
<%
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
