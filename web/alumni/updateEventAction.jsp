<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String venue = request.getParameter("venue");
    String description = request.getParameter("description");
    String status = request.getParameter("status");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from event where eventId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("update event set date='" + date + "',time='" + time + "',venue='" + venue + "',description='" + description + "',status='" + status + "' where eventId='" + id + "'");
                response.sendRedirect("addEvent.jsp?msg=Selected event updated successfully.");
            }
           if(check == 0) {
                response.sendRedirect("addEvent.jsp?msg=Selected event updatation unsuccessfull!!!");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>