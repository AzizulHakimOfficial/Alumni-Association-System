<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String method = request.getParameter("method");
    String by = request.getParameter("paymentBy");
    String tranId = request.getParameter("transactionId");
    String amount = request.getParameter("amount");
    String status = request.getParameter("status");
    String fundId = request.getParameter("fId");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("insert into fundspayment(email,date,time,paymentMethod,paymentBy,transactionId,amount,status,fundId) values(?,?,?,?,?,?,?,?,?)");
        ps.setString(1, email);
        ps.setString(2, date);
        ps.setString(3, time);
        ps.setString(4, method);
        ps.setString(5, by);
        ps.setString(6, tranId);
        ps.setString(7, amount);
        ps.setString(8, status);
        ps.setString(9, fundId);

        ps.executeUpdate();
        response.sendRedirect("editFund.jsp?msg=payment Info added Successfully.Wait for verification...");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("editFund.jsp?msg=payment Info addition Unsuccessfull");
    }

%>