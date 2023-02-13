<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("fName");
    String date = request.getParameter("fDate");
    String description = request.getParameter("fDescription");
    String status = request.getParameter("status");
    String amount = request.getParameter("fAmount");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from fundsDetails where fundId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("update fundsDetails set fName='" + name + "',fDescription='" + description + "',amount='" + amount + "',deadline='" + date + "',status='" + status + "' where fundId='" + id + "'");
                response.sendRedirect("addFund.jsp?msg=Selected fund details updated successfully.");
            }
           if(check == 0) {
                response.sendRedirect("addFund.jsp?msg=Selected fund details updatation unsuccessfull!!!");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>