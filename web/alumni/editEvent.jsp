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
        </style>


    </head>
    <body>  
        <% String AlumniType = session.getAttribute("alumniType").toString();%>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>

            <h1>Events</h1>
            <div class="Mcard">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Type</th>
                            <th scope="col">Title</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Venue</th>
                            <th scope="col">Event Status</th>
                                <% if ("Event Controller".equalsIgnoreCase(AlumniType)) { %>

                            <th scope="col">Status</th>
                                <% }
                                %>
                                <% if ("Finance Controller".equalsIgnoreCase(AlumniType)) { %>
                            <th scope="col">Add fund for event</th>
                                <% }
                                %>
                        </tr>
                    </thead>

                <tbody>
                    <%
                        try {

                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from event");
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
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(8)%></td>
                        <% if ("Event Controller".equalsIgnoreCase(AlumniType)) {%>

                        <td>
                            <a href="updateEvent.jsp?id=<%=id%>">Update</a>
                            <a href="deleteEvent.jsp?id=<%=id%>">Delete </a>
                        </td>
                        <% }
                        %>
                        <% if ("Finance Controller".equalsIgnoreCase(AlumniType)) {%>
                        <td><a href="addEventFund.jsp?eventId=<%=id%>">Click to Add Fund</a></td>
                        <% }
                        %>

                    </tr>
                    <%}
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </tbody>
                </table>
            </div>
            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
