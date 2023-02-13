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
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerAdmin.jsp"%>
            </div>
            <hr>
            <div style="color: white; text-align: center; font-size: 30px;">Alumni Panel (Academic Info)</div>
            <div>
            <table id="customers">
                    <tr>
                        <th scope="col">Student ID</th>
                        <th scope="col">Admission Session</th>
                        <th scope="col">Passing Session</th>
                        <th scope="col">Employment Status</th>
                        <th scope="col">Company Name</th>
                        <th scope="col">Designation</th>
                        <th scope="col">Job Allocation Year</th>
                    </tr>
                    <%
                        String emailalumni=request.getParameter("email");
                        try {
                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from alumni where email='"+emailalumni+"'");
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(11)%></td>
                        <td><%=rs.getString(12)%></td>
                        <td><%=rs.getString(13)%></td>
                        <td><%=rs.getString(14)%></td>
                    </tr>
                     <%}
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
            </table>
                </div>
            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
