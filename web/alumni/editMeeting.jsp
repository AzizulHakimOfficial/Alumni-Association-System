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
            .button{
                width: 180px;
                margin: auto;
                text-align: center;
            }
            .message{
                color: yellow;
                width: 200px;
                height: 100px;
                float: right;
                margin-top: -330px;
            }
            #customers a{
                color:blue;
            }
            #customers a:hover{
                color: red;
            }
        </style>

    </head>
    <body>  
        <% String AlumniType = session.getAttribute("alumniType").toString();%>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>
            <div style="color: white; text-align: center; font-size: 30px;">Meetings</div>
            <div class="table-responsive">
                <table id="customers">
                    <tr>
                        <th scope="col">Meeting ID</th>
                        <th scope="col">Meeting Subject</th>
                        <th scope="col">Meeting Date</th>
                        <th scope="col">Meeting Time</th>
                        <th scope="col">Meeting Description</th>

                        <% if ("Event Controller".equalsIgnoreCase(AlumniType)) { %>
                        <th scope="col">Status</th>
                            <% }
                            %>
                    </tr>
                    <%
                        try {

                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from meeting");
                            int id = 0;
                            while (rs.next()) {
                                id = rs.getInt(1);
                    %>
                    <tr>

                        <td><%=rs.getInt(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <% if ("Event Controller".equalsIgnoreCase(AlumniType)) {%>
                        <td>
                            <a href="updateMeeting.jsp?id=<%=id%>">Update</a></button>
                            <a href="deleteMeeting.jsp?id=<%=id%>">Delete </a></button>
                        </td>
                        <% }
                        %>

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
