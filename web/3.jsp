<%--
  Created by IntelliJ IDEA.
  User: 11637
  Date: 2020/4/23
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    int totalpages = 0;      //总页数
    int pageSize = 20;       //每一页展示的数据行数
    int totalRecords = 0;    //总的数据条数
    int xpage = 1;           //当前页
%>
<%
    //验证
    String passcard=(String)session.getAttribute("passcard");

    if (passcard==null||!passcard.equals("ok3")){
        out.print("尚未登录，2秒返回登录页面");
        response.setHeader("refresh","2;login.jsp");
        return;
    }
%>
<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/test";
    String USER = "root";
    String PASS = "password";

    try {
        // 数据库连接
        Class.forName(JDBC_DRIVER);
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
        String sql = "SELECT count(*) FROM web_class";
        PreparedStatement psmt = conn.prepareStatement(sql);
        ResultSet rs = psmt.executeQuery();

        rs.next();
        totalRecords = rs.getInt(1);      //获取所有的数据条数
        String aa = request.getParameter("page");  //获取当前页
        if (aa == null || xpage < 1) {
            xpage = 1;
        } else {
            try {
                xpage = Integer.parseInt(aa);
            } catch (NumberFormatException e) {
                xpage = 1;
            }
        }

        if (totalRecords % pageSize == 0) {
            totalpages = totalRecords / pageSize;
        } else {
            totalpages = totalRecords / pageSize + 1;
        }
        totalpages = (totalRecords + pageSize - 1) / pageSize;

        //显示当前数据
        sql = "SELECT * FROM web_class";
        psmt = conn.prepareStatement(sql);
        rs = psmt.executeQuery();

        if (xpage >= totalpages) {
            for (int i = 1; i <= (totalpages - 1) * pageSize; i++) {
                rs.next();
            }
        } else {
            for (int i = 1; i <= (xpage - 1) * pageSize; i++) {
                rs.next();
            }
        }
%>
<html>
<head>
    <title>Trump成绩查询</title>
</head>
<body>

<center>
    <h3>学生成绩</h3>
    <hr width="80%">
    <a href="add.jsp">添加学生信息</a>
    <table border="1" width="80%" align="center">
        <tr align="center">
            <th style="width: 20%"><b>学号</b></th>
            <th style="width: 20%"><b>姓名</b></th>
            <th style="width: 20%"><b>科目</b></th>
            <th style="width: 20%"><b>成绩</b></th>
            <th style="width: 20%"><b>操作</b></th>
            <th style="width: 20%"><b>操作</b></th>
        </tr>
        <% //数据库调取数据
            for (int i = 1; i <= pageSize; i++) {
                if (!rs.next()) {
                    break;
                }
                int a = rs.getInt(1);
                String b = rs.getString(2);
                String c = rs.getString(3);
                int d = rs.getInt(4);
        %>
        <%--     数据展示    --%>
        <form action="update.jsp">
            <tr align="center">
                <td style="width: 20%"><input  name="id" value="<%=a%>" />
                </td>
                <td style="width: 20%"><input type="text" name="name" value="<%=b%>" />
                </td>
                <td style="width: 20%"><input type="text" name="course" value="<%=c%>" />
                </td>
                <td style="width: 20%"><input type="text" name="score" value="<%=d%>" />
                </td>
                <td style="width: 20%"><input type="button" value="删除" onclick="del(<%=a%>)"></td>
                <td style="width: 20%"><input type="submit" value="更新" ></td>
            </tr>
        </form>
        <%
            }
        %>
    </table>
    <hr>
    <form name="myform" action="3.jsp">
        <a>共<%=totalpages%>页
            &nbsp&nbsp
            第<%=xpage%>页
            &nbsp&nbsp
            共<%=totalpages%>
            &nbsp&nbsp
            跳转到
        </a>
        <select onchange="go(this.value)">
            <%
                for (int i = 1; i <= totalpages; i++) {
                    if (i == xpage) {
                        out.print("<option selected>" + i + "</option>");
                    } else {
                        out.print("<option>" + i + "</option>");
                    }
                }
            %>
        </select>
        <a>页</a>
        <input type="text" name="page" size=1">
        &nbsp&nbsp
        <input type="button" value="首  页" <%=(xpage == 1) ? "disabled" : ""%> onclick="gn(<%=1%>)"/>
        &nbsp&nbsp
        <input type="button" value="上一页" <%=(xpage == 1) ? "disabled" : ""%> onclick="gn(<%=xpage-1%>)"/>
        &nbsp&nbsp
        <input type="button" value="下一页" <%=(xpage == totalpages) ? "disabled" : ""%> onclick="gn(<%=xpage+1%>)"/>
        &nbsp&nbsp
        <input type="button" value="尾  页" <%=(xpage == totalpages) ? "disabled" : ""%> onclick="gn(<%=totalpages%>)"/>
    </form>
</center>
<%
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>
<script>
    function go(x) {
        window.location.href = "3.jsp?page=" + x;
    }

    function gn(x) {
        window.location.href = "3.jsp?page=" + x;
    }

    function del(x) {
        window.location.href = "del.jsp?id=" + x;
    }
</script>
</body>
</html>
