<%@page import="database.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<html>
    <head>
        <link rel="stylesheet" href="../css/alumniInfoPrint.css">
        <title>Alumni Info</title>
    </head>
    <body>
        <%String email = session.getAttribute("email").toString();
            String userType = request.getParameter("userType");
        %>
        <h1>Alumni Association</h1>

        <hr>

        <% if ("alumni".equalsIgnoreCase(userType)) { %>
         <h4>Alumni Data</h4>
        <table id="customers">
            <tr>
                <th scope="col">Email</th>
                <th scope="col">Name</th>
                <th scope="col">Mobile Number</th>
                <th scope="col">Department</th>
                <th scope="col">Student ID</th>
                <th scope="col">Admission Session</th>
                <th scope="col">Passing Session</th>
                <th scope="col">Employment Status</th>
                <th scope="col">Company Name</th>
                <th scope="col">Designation</th>
                <th scope="col">Job Allocation Year</th>
                <th scope="col">Alumni Type</th>
            </tr>
            <%

                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from alumni");
                    while (rs.next()) {

            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getInt(3)%></td>
                <td><%=rs.getString(10)%></td>
                <td><%=rs.getString(9)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(11)%></td>
                <td><%=rs.getString(12)%></td>
                <td><%=rs.getString(13)%></td>
                <td><%=rs.getString(14)%></td>
                <td><%=rs.getString(15)%></td>

            </tr>
            <tr>
                <%}
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
        </table>
         <br>
        <div class="">
            <button class="button left-button"><a href="alumniPersonalInfo.jsp">Back</a></button>
        <%}
        %>

        
        <% if ("student".equalsIgnoreCase(userType)) { %>
         <h4>Student Data</h4>
        <table id="customers">
            <tr>
                <th scope="col">Email</th>
                <th scope="col">Name</th>
                <th scope="col">Mobile Number</th>
                <th scope="col">Department</th>
                <th scope="col">Student ID</th>
                <th scope="col">Admission Session</th>
            </tr>
            <%

                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from student");
                    while (rs.next()) {

            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getInt(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>

            </tr>
            <tr>
                <%}
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
        </table>
         <br>
        <div class="">
            <button class="button left-button"><a href="studentsPanel.jsp">Back</a></button>
        <%}
        %>

       
            <a onclick="window.print();"><button class="button right-button">Print</button></a>
            <br><br><br><br>
        </div>

    </body>
</html>