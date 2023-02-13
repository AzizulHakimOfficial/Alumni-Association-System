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
                width: 80%;
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
                max-width: 100%;
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

        </style>

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerStudent.jsp"%>
            </div>
            <hr>
            <div style="color: white; text-align: center; font-size: 30px;">Job/Opportunity</div>
            <div class="table-responsive">
                <table id="customers">
                    <tr>
                        <th scope="col">Company Name</th>
                        <th scope="col">Profile</th>
                        <th scope="col">Vacancy Position</th>
                        <th scope="col">Description</th>
                        <th scope="col">Category</th>
                        <th scope="col">Location</th>
                        <th scope="col">Experience</th>
                        <th scope="col">deadline</th>
                        <th scope="col">type</th>
                        <th scope="col">email</th>
                    </tr>
                    <%
                        try {

                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from job");
                            int id = 0;
                            while (rs.next()) {
                                id = rs.getInt(1);
                    %>
                    <tr>

                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(10)%></td>
                        <td><%=rs.getString(11)%></td>
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
