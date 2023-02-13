<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>

<%
    String feesId = request.getParameter("id");
    String status = request.getParameter("status");;
    int check = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from membershipFee where feesId='" + feesId + "'");
        if (("Pending").equalsIgnoreCase(status)) {
            while (rs.next()) {
                check = 1;
                st.executeUpdate("update membershipFee set status='Approved' where feesId='" + feesId + "'");
                response.sendRedirect("membershipFee.jsp?msg=Selected payment status updated successfully.");
            }
        } else if (("Approved").equalsIgnoreCase(status)) {
            while (rs.next()) {
                check = 1;
                st.executeUpdate("update membershipFee set status='Pending' where feesId='" + feesId + "'");
                response.sendRedirect("membershipFee.jsp?msg=Selected payment status updated successfully.");
            }
        }
        if (check == 0) {
            response.sendRedirect("membershipFee.jsp?msg=Selected payment status updation unsuccessfull!!!");
        }
    } catch (Exception e) {
        System.out.println(e);
    }

%>