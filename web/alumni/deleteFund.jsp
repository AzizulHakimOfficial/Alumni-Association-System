<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from fundsDetails where fundId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("delete from fundsDetails where fundId='" + id + "'");
                response.sendRedirect("addFund.jsp?msg=Selected Fund Details deleted successfully");
            }
           if(check == 0) {
                response.sendRedirect("addFund.jsp?msg=Selected Fund Details deletetion Unsuccessfull");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>