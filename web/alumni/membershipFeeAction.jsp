<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String date = request.getParameter("date");
    String month = request.getParameter("month");
    String time = request.getParameter("time");
    String method = request.getParameter("method");
    String by = request.getParameter("paymentBy");
    String tranId = request.getParameter("transactionId");
    String amount = request.getParameter("amount");
    String status = request.getParameter("status");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("insert into membershipFee(email,date,time,paymentMethod,paymentBy,transactionId,amount,status,month) values(?,?,?,?,?,?,?,?,?)");
        ps.setString(1, email);
        ps.setString(2, date);
        ps.setString(3, time);
        ps.setString(4, method);
        ps.setString(5, by);
        ps.setString(6, tranId);
        ps.setString(7, amount);
        ps.setString(8, status);
        ps.setString(9, month);

        ps.executeUpdate();
        response.sendRedirect("membershipFee.jsp?msg=Fee Info added Successfully.Wait for verification...");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("membershipFee.jsp?msg=Fee Info addition Unsuccessfull");
    }

%>