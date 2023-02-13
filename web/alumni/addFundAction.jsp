<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String name = request.getParameter("fName");
    String date = request.getParameter("fDate");
    String amount = request.getParameter("fAmount");
    String status = request.getParameter("fStatus");
    String description = request.getParameter("fDescription");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("insert into fundsDetails(fName,fDescription,amount,deadline,status) values(?,?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, description);
        ps.setString(3, amount);
        ps.setString(4, date);
        ps.setString(5, status);

        ps.executeUpdate();
        response.sendRedirect("addFund.jsp?msg=Fund Added Successfully");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("addFund.jsp?msg=Fund addition Unsuccessfull");
    }

%>