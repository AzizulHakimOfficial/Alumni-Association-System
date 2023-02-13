<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String cName = request.getParameter("name");
    String cProfile = request.getParameter("profile");
    String vPosition = request.getParameter("position");
    String vCategory = request.getParameter("category");
    String description = request.getParameter("description");
    String location = request.getParameter("location");
    String experience = request.getParameter("experience");
    String deadline = request.getParameter("deadline");
    String type = request.getParameter("type");
    String email = request.getParameter("email");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("insert into job(cName,cProfile,vPosition,description,vCategory,location,experience,deadline,type,email) values(?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1, cName);
        ps.setString(2, cProfile);
        ps.setString(3, vPosition);
        ps.setString(4, description);
        ps.setString(5, vCategory);
        ps.setString(6, location);
        ps.setString(7, experience);
        ps.setString(8, deadline);
        ps.setString(9, type);
        ps.setString(10, email);
        ps.executeUpdate();
        response.sendRedirect("addJobOpportunity.jsp?msg=Job/Opportunity addedd successfully");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("addJobOpportunity.jsp?msg=Job/Opportunity addition unsuccessfull!");
    }

%>