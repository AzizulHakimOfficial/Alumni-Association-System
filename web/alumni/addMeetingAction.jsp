<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String subject = request.getParameter("subject");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String description = request.getParameter("description");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("insert into meeting(subject,date,time,description) values(?,?,?,?)");
        ps.setString(1, subject);
        ps.setString(2, date);
        ps.setString(3, time);
        ps.setString(4, description);
        ps.executeUpdate();
        response.sendRedirect("addMeeting.jsp?msg=Meeting added successfully");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("addMeeting.jsp?msg=Meeting addition unsuccessfull!");
    }

%>