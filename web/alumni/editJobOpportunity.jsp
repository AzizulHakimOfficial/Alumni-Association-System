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
        </style>

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>
            <h1>Edit & View Job/Opportunity</h1>
            <div class="Mcard table-responsive">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead> <tr>
                            <th scope="col">Job ID</th>
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
                            <th scope="col">status</th>
                        </tr>
                    </thead>
                    <%                        try {

                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from job");
                            int id = 0;
                            while (rs.next()) {
                                id = rs.getInt(1);
                    %>
                    <tbody>
                        <tr>

                            <td><%=rs.getInt(1)%></td>
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
                            <td>
                                <a href="updateJobOpportunity.jsp?id=<%=id%>">Update</a></button>
                                <a href="deleteJobOpportunity.jsp?id=<%=id%>">Delete </a></button>
                            </td>
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
