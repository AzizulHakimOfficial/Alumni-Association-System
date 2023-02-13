<%-- 
    Document   : adminHome
    Created on : Oct 22, 2022, 12:45:37 PM
    Author     : Azizul Hakim'PC
--%>
<%@page import="database.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="../css/commonTableCss.css">
        <style>
            body{
                background-color: #18184e;
            }
            .container{
                background-image: url("../images/blue-bg.png");
                height: 100%;
                background-position: center;
                background-size:cover;
                background-repeat: no-repeat;
                position: relative;
            }
            .container:hover{
                border: 1px solid black;
            }
            .header{
                padding-top: 10px;
            }
            .card-1{
                height: 350px;
                width: 48%;
                float: left;
                border: 1px solid black;
                margin-right: 6px;
            }

            .card-3{
                height: 350px;
                width: 48%;
                float: right;
                margin: auto;
                border: 1px solid black;
            }
        </style>

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerAdmin.jsp"%>
            </div>
            <hr>
            <%
                int sum = 0;
                int total = 0;
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs4 = st.executeQuery("select amount from membershipfee where status='Approved'");
                    while (rs4.next()) {
                        sum = sum + Integer.parseInt(rs4.getString(1));
                    }

            %>
            <div class="card-1 table-responsive">
                <div class="Mcard">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Total from Membership Fees</th>
                                <th scope="col">Total Amount</th>
                            </tr>
                        </thead>
                        <%ResultSet rs5 = st.executeQuery("select * from associationAccount order by id desc");
                            while (rs5.next()) {

                        %>
                        <tbody>
                            <tr>
                                <td><%=rs5.getInt(1)%></td>
                                <td><%=sum%></td>

                                <td><%=rs5.getString(2)%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="card-3 table-responsive">
                <div class="Mcard">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Fund Id</th>
                                <th scope="col">Fund Collection</th>
                                <th scope="col">Fund Cost</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ResultSet rs3 = st.executeQuery("select * from associationaccount order by id desc");
                                while (rs3.next()) {
                            %>
                            <tr>
                                <td><%=rs3.getString(1)%></td>
                                <td><%=rs3.getString(3)%></td>
                                <td><%=rs3.getString(4)%></td>
                                <td><%=rs3.getString(5)%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <%
                } catch (Exception e) {
                    System.out.println(e);
                }
            %>
            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
