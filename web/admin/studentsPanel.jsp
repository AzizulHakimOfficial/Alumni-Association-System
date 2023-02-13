<%-- 
    Document   : adminHome
    Created on : Oct 22, 2022, 12:45:37 PM
    Author     : Azizul Hakim'PC
--%>
<%@page import="database.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/commonTableCss.css">
        <%@include file="message.jsp" %>
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
        </style>

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerAdmin.jsp"%>
            </div>

            <h1>Students Panel</h1>
            <div style="color: white;font-size: 20px; float: right; padding-bottom: 10px;">
                <a href="alumniInfoPrint.jsp?userType=student" style="color:yellow;">Print All Student Data</a>
            </div>
            <div class="search-container">
                <form action="searchAlumni.jsp?userType=student" method="post">
                    <input type="text" placeholder="Search" name="search">
                    <button type="submit"><i class="fa fa-search">Click</i></button>
                </form>
            </div>
            <hr>

            <div  class="Mcard table-responsive">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Mobile Number</th>
                            <th scope="col">Department</th>
                            <th scope="col">Student ID</th>
                            <th scope="col">Session</th>
                            <th scope="col">Active Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Connection con = ConnectionProvider.getCon();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from student");
                                while (rs.next()) {
                        %>
                        <tr>

                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><a href="studentsPanelAction.jsp?name=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>&status=<%=rs.getString(10)%>" title="Click to change status"><%=rs.getString(10)%></a></td>
                        </tr>
                        <%}
                            } catch (Exception e) {
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
