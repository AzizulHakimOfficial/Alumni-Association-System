<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from notice where noticeId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("delete from notice where noticeId='" + id + "'");
                response.sendRedirect("addNotice.jsp?msg=Selected notice deleted successfully.");
            }
           if(check == 0) {
                response.sendRedirect("addNotice.jsp?msg=Selected notice deletion unsuccessfull");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>