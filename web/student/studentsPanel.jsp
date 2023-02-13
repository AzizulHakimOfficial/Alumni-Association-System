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
        <%@include file="../admin/message.jsp" %>
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
    <% String Email = session.getAttribute("email").toString();
        String user = session.getAttribute("userType").toString();
    %>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerStudent.jsp"%>
            </div>

            <hr>
            <div style="color: white; text-align: center; font-size: 30px;">Students Panel</div>
            <div class="search-container">
                <form action="searchAlumniStudent.jsp?userType=student" method="post">
                    <input type="text" placeholder="Search" name="search">
                    <button type="submit"><i class="fa fa-search">Click</i></button>
                </form>
            </div><br>
            <div>
                <table id="customers">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Mobile Number</th>
                        <th scope="col">Department</th>
                        <th scope="col">Student ID</th>
                        <th scope="col">Session</th>
                        <th scope="col">Message</th>
                    </tr>
                    <%                        try {
                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from student where email NOT IN('" + Email + "') and status='Verified'");
                            while (rs.next()) {
                    %>
                    <tr>

                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><a href="#?email=<%=rs.getString(1)%>&status=<%=rs.getString(10)%>" title="Click to change status">Send Message</a></td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                        }
                    %>
                </table>
            </div>
            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
