<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String emailS = request.getParameter("emailStudent");
    String passwordS = request.getParameter("passwordStudent");
    String usertype = request.getParameter("userType");
    int z = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        if ("alumni".equals(usertype)){
            ResultSet rs = st.executeQuery("select * from alumni where email='" + emailS + "' and password='" + passwordS + "'");
            while (rs.next()) {
                if ("verified".equalsIgnoreCase(rs.getString(16))) {
                    z = 1;
                    session.setAttribute("email", emailS);
                    response.sendRedirect("alumni/alumniHome.jsp");
                } else if("not verified".equalsIgnoreCase(rs.getString(16))) {
                    response.sendRedirect("verificationMessage.jsp");
                }
            }
        } else if ("student".equals(usertype)) {
            ResultSet rs1 = st.executeQuery("select * from student where email='" + emailS + "' and password='" + passwordS + "'");
            while (rs1.next()) {
                if ("verified".equalsIgnoreCase(rs1.getString(10))) {
                    z = 1;
                    session.setAttribute("email", emailS);
                    session.setAttribute("userType", usertype);
                    response.sendRedirect("student/studentHome.jsp");
                } else if("not verified".equalsIgnoreCase(rs1.getString(10))) {
                    response.sendRedirect("verificationMessage.jsp");
                }
            }
        }
        if (z != 1) {
            response.sendRedirect("login.jsp?msg=Invalid username/Password or User Notexist");
        }
    } catch (Exception e) {
        System.out.println(e);
    }%>