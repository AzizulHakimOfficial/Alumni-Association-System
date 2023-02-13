<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>

<%
    String fundId = request.getParameter("fundId");
    String fundcost = request.getParameter("fundcost");
    int check = 0;
    int exist = 0;
    int sumC = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select amount from fundspayment where fundId='" + fundId + "' and status='Approved'");
        int sum = 0;
        int total = 0;
        int totalUp=0;
        while (rs.next()) {
            sumC = sumC + Integer.parseInt(rs.getString(1));
        }
        ResultSet rs4 = st.executeQuery("select amount from membershipfee where status='Approved'");
        while (rs4.next()) {
            sum = sum + Integer.parseInt(rs4.getString(1));
        }
        total = sum + sumC - Integer.parseInt(fundcost);
        ResultSet rs1 = st.executeQuery("select * from associationaccount where fundId='" + fundId + "'");
        while (rs1.next()) {
            check = 1;
            exist = 1;
            totalUp = sum + sumC-Integer.parseInt(fundcost);
            st.executeUpdate("update associationaccount set fundCollection='" + String.valueOf(sumC) + "',fundCost='" + fundcost + "',totalAmount='"+totalUp+"' where fundId='" + fundId + "'");
            response.sendRedirect("associationAcc.jsp?msg=Data updated successfully.");
        }
        if (exist == 0) {

            PreparedStatement ps = con.prepareStatement("insert into associationaccount(fundId,fundCollection,fundCost,totalAmount) values(?,?,?,?)");
            ps.setString(1, fundId);
            ps.setString(2, String.valueOf(sumC));
            ps.setString(3, fundcost);
            ps.setString(4, String.valueOf(total));
            ps.executeUpdate();
            response.sendRedirect("associationAcc.jsp?msg=Data Inserted successfully.");
        }

        if (check == 0) {
            response.sendRedirect("associationAcc.jsp?msg=Data updation unsuccessfull!!!");
        }
    } catch (Exception e) {
        System.out.println(e);
    }

%>