<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>

<%
    String email = request.getParameter("email");
    String alumniType = request.getParameter("alumniType");
    String status = request.getParameter("status");
    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from alumni where email='" + email + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("update alumni set alumniType='" + alumniType + "',status='" + status + "' where email='" + email + "'");
                response.sendRedirect("alumniPersonalInfo.jsp?msg=Selected Alumni data updated successfully.");
            }
           if(check == 0) {
                response.sendRedirect("alumniPersonalInfo.jsp?msg=Selected Alumni data updation unsuccessfull!!!");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>