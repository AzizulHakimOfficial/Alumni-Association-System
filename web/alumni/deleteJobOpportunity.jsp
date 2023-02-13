<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from job where jobId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("delete from job where jobId='" + id + "'");
                response.sendRedirect("editJobOpportunity.jsp?msg=Job/Opportunity deleted successfully.");
            }
           if(check == 0) {
                response.sendRedirect("editJobOpportunity.jsp?msg=Job/Opportunity deletion unsuccessfull!!!");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>