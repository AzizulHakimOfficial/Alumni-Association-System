<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("contactId");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from contact where contactId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("delete from contact where contactId='" + id + "'");
                response.sendRedirect("contact.jsp?msg=Selected message deleted successfully");
            }
           if(check == 0) {
                response.sendRedirect("contact.jsp?msg=Selected message deletetion Unsuccessfull");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>