<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String subject = request.getParameter("subject");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String description = request.getParameter("description");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from meeting where meetingId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("update meeting set subject='" + subject + "',date='" + date + "',time='" + time + "',description='" + description + "' where meetingId='" + id + "'");
                response.sendRedirect("editMeeting.jsp?msg=Selected meeting updated successfully.");
            }
           if(check == 0) {
                response.sendRedirect("editMeeting.jsp?msg=Selected meeting updation unsuccessfull!!!");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>