<%@page errorPage="error.jsp" %>
<%@page import="database.ConnectionProvider"%>
<%@page import="servlets.UploadServlet"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <%@include file="admin/message.jsp" %>
        <style>
            body{
                background-color: #18184e;
            }
            .container{
                background-image: url("../images/blue-bg.png");
                height: 100%;
                background-position: center;
                background-size:cover;
                background-repeat: no-repeat;
                position: relative;
            }
            .container:hover{
                border: 1px solid black;
            }
            .header{
                padding-top: 10px;
            }
            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #customers td, #customers th {
                border: 0.5px solid #ddd;
                padding: 2px;
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
                padding-top: 3px;
                padding-bottom: 3px;
                text-align: left;
                background-color:#ccc;
                color: black;
            }

            #customers a{
                color:blue;
            }
            #customers a:hover{
                color: red;
            }
            .message{
                color: yellow;
                width: 200px;
                height: 100px;
                float: right;
                margin-top: -330px;
            }
            .card-1{
                height:230px;

                width: 40%;
                background-color:darkcyan;
                float: left;
                border: 1px solid black;
                margin-right: 6px;
            }
            .card-2{
                float: left;
                max-height: 500px;
                width:49%;

                margin-right: 6px;
            }
            .card-4{
                float: right;
                max-height: 500px;
                width:49%;
                border: 1px solid black;
            }

            .card-3{
                height: 230px;
                width: 40%;
                background-color:darkcyan;
                float: right;
                margin: auto;
                border: 1px solid black;
                color:white;
                text-align: center;
            }

        </style>

        <%  try {
                response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Cache-Control", "no-store");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                if (session.getAttribute("email") == null) {
                    response.sendRedirect("login.jsp");
                } else {
                }
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </head>
    <body>  

        <% String eemail = session.getAttribute("email").toString();
            String typee = null;

        %>
        <div class="container">
            <br>
            <hr>
            <%if ("admin@gmail.com".equalsIgnoreCase(eemail)) {%>
            <div>
                <a href="admin/adminHome.jsp" style="font-size: 20px;font-weight: bold;color: yellow; " title="Click to back to the Home">Back to the Home</a>
            </div>
            <% }
            %>
            <%
                if (!"admin@gmail.com".equalsIgnoreCase(eemail)) {
                    typee = session.getAttribute("alumniType").toString();%>
            <div>
                <a href="alumni/alumniHome.jsp" style="font-size: 20px;font-weight: bold;color: yellow; " title="Click to back to the Home">Back to the Home</a>
            </div>
            <% }
            %>
            <br>
            <% try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs1 = st.executeQuery("select * from event");

            %>
            <%if ("finance Controller".equalsIgnoreCase(typee)) {%>
            <div class="card-1 center" style="max-width: 100%; color: white;">
                <div style="color: white; text-align: center; font-size: 30px;">Form Details(Event)</div>
                <center>

                    <form action="UploadServlet" method="post" enctype="multipart/form-data">
                        <table width="400px" align="center">

                            <tr>
                                <td>Event ID</td>
                                <td>
                                    <select class="col-sm-8" name="eventid" required>
                                        <% while (rs1.next()) {%>
                                        <option value="<%=rs1.getInt(1)%>"><%=rs1.getInt(1)%></option>
                                        <% }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Select File </td>
                                <td>
                                    <input type="file" required="" name="file">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><br><input class="btn btn-warning" type="submit" value="Submit"></td>
                            </tr>
                        </table>

                    </form>
                    <br>
                </center>

            </div>

            <div class="card-3 center">
                <div style="color: white; text-align: center; font-size: 30px;">Form Details(Fund)</div>
                <center>
                    <%
                        ResultSet rs2 = st.executeQuery("select * from fundsdetails where eventId is NULL");
                    %>
                    <form action="FundUploadServlet" method="post" enctype="multipart/form-data">
                        <table width="400px" align="center">

                            <tr>
                                <td>Event ID</td>
                                <td>
                                    <select class="col-sm-8" name="eventid" required>
                                        <% while (rs2.next()) {%>
                                        <option value="<%=rs2.getInt(1)%>"><%=rs2.getInt(1)%></option>
                                        <% }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Select File </td>
                                <td>
                                    <input type="file" required="" name="file">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><br><input class="btn btn-warning" type="submit" value="Submit"></td>
                            </tr>
                        </table>

                    </form>

                    <br>
                </center>
            </div>
            <% }
            %>
            <div class="card-2">
                <table id="customers">
                    <tr>
                        <th>Event ID</th><th>Event Name</th><th>File Name</th><th>File Path</th><th>Added Date</th><th>Download</th>
                    </tr>
                    <%
                        ResultSet rs2 = st.executeQuery("select * from event");
                        while (rs2.next()) {
                    %>
                    <tr>
                        <td><%=rs2.getInt(1)%></td>
                        <td><%=rs2.getString(3)%></td>
                        <td><%=rs2.getString(9)%></td>
                        <td><%=rs2.getString(10)%></td>
                        <td><%=rs2.getTimestamp(11)%></td>
                        <td><a href="DownloadServlet?fileName=<%=rs2.getString(9)%>">Download</a></td>
                    </tr>
                    <%
                        }
                    %>

                </table><br>
            </div>
            <div class="card-4">
                <table id="customers">
                    <tr>
                        <th>Fund ID</th><th>Fund Name</th><th>File Name</th><th>File Path</th><th>Added Date</th><th>Download</th>
                    </tr>
                    <%
                        ResultSet rs3 = st.executeQuery("select * from fundsdetails where eventId is NULL");
                        while (rs3.next()) {
                    %>
                    <tr>
                        <td><%=rs3.getInt(1)%></td>
                        <td><%=rs3.getString(2)%></td>
                        <td><%=rs3.getString(8)%></td>
                        <td><%=rs3.getString(9)%></td>
                        <td><%=rs3.getTimestamp(10)%></td>
                        <td><a href="DownloadServlet?fileName=<%=rs3.getString(8)%>">Download</a></td>
                    </tr>
                    <%
                        }
                    %>

                </table>
            </div>
            <%} catch (Exception e) {
                }%> 
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>

