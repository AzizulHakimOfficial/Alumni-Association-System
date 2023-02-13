<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from meeting where meetingId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("delete from meeting where meetingId='" + id + "'");
                response.sendRedirect("editMeeting.jsp?msg=Selected meeting deleted successfully.");
            }
           if(check == 0) {
                response.sendRedirect("editMeeting.jsp?msg=Selected meeting deletion unsuccessfull!!!");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>