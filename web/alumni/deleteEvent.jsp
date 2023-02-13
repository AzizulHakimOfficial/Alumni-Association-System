<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from event where EventId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("delete from event where eventId='" + id + "'");
                response.sendRedirect("editEvent.jsp?msg=Selected event deleted successfully");
            }
           if(check == 0) {
                response.sendRedirect("editEvent.jsp?msg=Selected event deletetion Unsuccessfull");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>