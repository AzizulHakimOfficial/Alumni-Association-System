<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>

<%

    String email = request.getParameter("email");
    String status = request.getParameter("status");;
    String name = request.getParameter("name");;
    int check = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from student where email='" + email + "'");

        if (("not verified").equalsIgnoreCase(status)) {
            while (rs.next()) {
                check = 1;
                st.executeUpdate("update student set status='Verified' where email='" + email + "'");
                ResultSet rs1 = st.executeQuery("select * from user where email='" + email + "'");
                while (!rs1.next()) {
                    PreparedStatement ps = con.prepareStatement("insert into user(name,email) values(?,?)");
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.executeUpdate();
                }
                response.sendRedirect("studentsPanel.jsp?msg=Selected Student data updated successfully.");
            }
        } else if (("verified").equalsIgnoreCase(status)) {
            while (rs.next()) {
                check = 1;
                st.executeUpdate("update student set status='Not Verified' where email='" + email + "'");
                response.sendRedirect("studentsPanel.jsp?msg=Selected Student data updated successfully.");
            }
        }
        if (check == 0) {
            response.sendRedirect("studentsPanel.jsp?msg=Selected Student data updation unsuccessfull!!!");
        }
    } catch (Exception e) {
        System.out.println(e);
    }

%>