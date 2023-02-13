<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String subject = request.getParameter("subject");
    String description = request.getParameter("description");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("insert into notice(noticeSubject,noticeDescription) values(?,?)");
        ps.setString(1, subject);
        ps.setString(2, description);
        ps.executeUpdate();
        response.sendRedirect("addNotice.jsp?msg=Notice Added Successfully");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("addNotice.jsp?msg=Notice Addition Unsuccuessful");
    }

%>