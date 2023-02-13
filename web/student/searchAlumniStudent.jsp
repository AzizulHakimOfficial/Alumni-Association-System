<%@page import="database.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Home</title>
        <link rel="stylesheet" href="../css/alumniInfoPrint.css">
        <style>
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
            #customers a:hover{
                color: red;
            }

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color:#ccc;
                color: black;
            }
            h1
            {
                text-align: center;
                color: black;
            }
        </style>
    </head>
    <body>
        <%String email = session.getAttribute("email").toString();
            String userType = request.getParameter("userType");

            String search = request.getParameter("search");
        %>
        <h1>Alumni Association</h1><hr>

        <% if ("alumni".equalsIgnoreCase(userType)) { %>
        <h4>Alumni Data</h4>
        <table>
            <table id="customers">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Mobile Number</th>
                    <th scope="col">Email</th>
                    <th scope="col">Admission Session</th>
                    <th scope="col">Department</th>
                    <th scope="col">Student ID</th>
                    <th scope="col">Academic Info</th>
                    <th scope="col">Alumni Type</th>
                </tr>
                <%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from alumni where name like '%" + search + "%' or email like '%" + search + "%' or mobileNumber like '%" + search + "%' or admissionSession like '%" + search + "%' or studentid like '%" + search + "%' or department like '%" + search + "%' or alumniType like '%" + search + "%'");
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
                    <td><%=rs.getString(15)%></td>
                    </tr>

                <%}
                    } catch (Exception e) {
                    }
                %>
            </table>
            <%}
            %>



            <% if ("student".equalsIgnoreCase(userType)) { %>
            <h4>Student Data</h4>
            <table>
                <table id="customers">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Mobile Number</th>
                        <th scope="col">Department</th>
                        <th scope="col">Student ID</th>
                        <th scope="col">Session</th>
                    </tr>
                    <%
                        try {
                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from student where name like '%" + search + "%' or email like '%" + search + "%' or mobileNumber like '%" + search + "%' or session like '%" + search + "%' or studentid like '%" + search + "%' or department like '%" + search + "%'");
                            while (rs.next()) {
                    %>
                    <tr>

                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                       </tr>

                    <%}
                        } catch (Exception e) {
                        }
                    %>
                </table>
                <%}
                %>









                <h4 style="color:white; text-align: center;">No more to show</h4>

                <br>
                <!--<div class="">
                        <button class="button left-button"><a href="alumniPersonalInfo.jsp">Back</a></button>
                        <a onclick="window.print();"><button class="button right-button">Print</button></a>
                    </div>
                -->
                </body>
                </html>