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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
        <% String Email = session.getAttribute("email").toString();
            String AlumniType = session.getAttribute("alumniType").toString();
        %>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>

            <hr>
            <h1>Alumni Panel (Personal Info)</h1>
            <div class="Mcard">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Mobile Number</th>
                            <th scope="col">Email</th>
                            <th scope="col">Admission Session</th>
                            <th scope="col">Department</th>
                            <th scope="col">Student ID</th>
                            <th scope="col">Academic Info</th>
                            <th scope="col">Alumni Type</th>
                            <th scope="col">Message</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                        try {
                                Connection con = ConnectionProvider.getCon();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from alumni where email NOT IN('" + Email + "') and status='Verified'");
                                while (rs.next()) {
                        %>

                        <tr>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(10)%></td>
                            <td><%=rs.getString(9)%></td>

                            <td>
                                <a href="alumniAcademicInfo.jsp?email=<%=rs.getString(1)%>">Academic Info</a>
                            </td>
                            <% if ("President".equals(AlumniType)) {%>
                            <td><a href="alumniPersonalInfoUpdate.jsp?email=<%=rs.getString(1)%>" title="Click to change Alumni Type"><%=rs.getString(15)%></a></td>
                                <%
                            } else {%>
                            <td><%=rs.getString(15)%></td>
                            <%
                                }
                            %>                        
                            <td><a href="chat.jsp?toEmail=<%=rs.getString(1)%>" title="Click to chat Alumni">send message</a></td>    
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
