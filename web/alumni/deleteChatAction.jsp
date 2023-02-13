<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("Id");
    String to = request.getParameter("to");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from contact where contactId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("delete from contact where contactId='" + id + "'");
                response.sendRedirect("chat.jsp?toEmail="+to+"&msg=Selected message deleted successfully");
            }
           if(check == 0) {
                response.sendRedirect("chat.jsp?toEmail="+to+"&msg=Selected message deletetion Unsuccessfull");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>