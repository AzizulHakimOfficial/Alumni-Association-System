<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");

    try {
        Connection con = ConnectionProvider.getCon();

        PreparedStatement ps = con.prepareStatement("insert into contact(mfrom,mto,subject,message) values(?,?,?,?)");
        ps.setString(1, from);
        ps.setString(2, to);
        ps.setString(3, subject);
        ps.setString(4, message);

        ps.executeUpdate();
        response.sendRedirect("chat.jsp?toEmail="+to+"&msg=message sent Successfully");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("chat.jsp?toEmail="+to+"&msg=message not sent.");
    }

%>