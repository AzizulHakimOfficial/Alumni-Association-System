<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");
    String Email = null;

    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        if ("President".equalsIgnoreCase(to)||"Event Controller".equalsIgnoreCase(to)||"Finance Controller".equalsIgnoreCase(to)) {
            ResultSet rs = st.executeQuery("select email from alumni where alumniType='" + to + "'");
            while (rs.next()) {
                Email = rs.getString(1);
            }
        }

        PreparedStatement ps = con.prepareStatement("insert into contact(mfrom,mto,subject,message) values(?,?,?,?)");
        ps.setString(1, from);
        ps.setString(2, Email);
        ps.setString(3, subject);
        ps.setString(4, message);

        ps.executeUpdate();
        response.sendRedirect("contact.jsp?msg=message sent Successfully");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("contact.jsp?msg=message not sent.");
    }

%>