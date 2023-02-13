<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String title = request.getParameter("name");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String venue = request.getParameter("venue");
    String description = request.getParameter("description");
    String status = request.getParameter("status");
    String type = request.getParameter("type");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("insert into event(type,title,date,time,venue,description,status) values(?,?,?,?,?,?,?)");
        ps.setString(1, type);
        ps.setString(2, title);
        ps.setString(3, date);
        ps.setString(4, time);
        ps.setString(5, venue);
        ps.setString(6, description);
        ps.setString(7, status);
        ps.executeUpdate();
        response.sendRedirect("addEvent.jsp?msg=Event Added Successfully");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("addEvent.jsp?msg=Event addition Unsuccessfull");
    }

%>