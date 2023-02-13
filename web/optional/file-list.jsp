<%-- 
    Document   : file-list
    Created on : 18 Oct, 2018, 8:11:09 PM
    Author     : Dharmesh Mourya
--%>

<%@page import="database.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            tr,td,th{
                padding: 20px;
                text-align: center;
            }
            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 70%;
            }

            #customers td, #customers th {
                border: 0.5px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){
                background-color: #f2f2f2;

            }
            #customers tr:nth-child(odd){
                background-color: #ddd;
            }
            #customers tr:nth-child(even):hover{
                background-color:antiquewhite;

            }
            #customers tr:nth-child(odd):hover{
                background-color: antiquewhite;
            }

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color:#ccc;
                color: black;
            }
        </style>
    </head>
    <%
        String email = request.getParameter("email");

        String type = request.getParameter("type");
    %>
    <body>
        
    <center>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            con = ConnectionProvider.getCon();

            if ("event".equalsIgnoreCase(type)) { %>
            <table id="customers" border="2">
            <tr>
                <th>Event ID</th><th>Event Name</th><th>File Name</th><th>File Path</th><th>Added Date</th><th>Download</th>
            </tr>
            <%
                String sql = "select * from event";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(9)%></td>
                <td><%=rs.getString(10)%></td>
                <td><%=rs.getTimestamp(11)%></td>
                <td><a href="DownloadServlet?fileName=<%=rs.getString(9)%>">Download</a></td>
            </tr>
            <%
                }
            %>

        </table><br>
        <%} else if ("fund".equalsIgnoreCase(type)) {%>
        <table id="customers" border="2">
            <tr>
                <th>Fund ID</th><th>Fund Name</th><th>File Name</th><th>File Path</th><th>Added Date</th><th>Download</th>
            </tr>
            <%
                String sql = "select * from fundsdetails where eventId is NULL";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(9)%></td>
                <td><%=rs.getTimestamp(10)%></td>
                <td><a href="DownloadServlet?fileName=<%=rs.getString(8)%>">Download</a></td>
            </tr>
            <%
                }
            %>

        </table><br>
        <%}
        %>

        <a href="addEventFundReport.jsp">Home</a>
    </center>
</body>
</html>