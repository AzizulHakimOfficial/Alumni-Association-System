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
        <%@include file="../admin/message.jsp" %>
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
            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #customers td, #customers th {
                border: 0.5px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){
                background-color: #f2f2f2;

            }
            #customers tr:nth-child(odd){
                background-color: #ddd;
            }
            #customers tr:nth-child(even):hover{
                background-color:antiquewhite;

            }
            #customers tr:nth-child(odd):hover{
                background-color: antiquewhite;
            }
            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color:#ccc;
                color: black;
            }
            .card-1{
                height: 350px;
                width: 33%;
                float: left;
                border: 1px solid black;
                margin-right: 6px;
            }
            .card-2{
                height: 350px;
                width: 33%;
                float: left;
                margin: auto;
                border: 1px solid black;
                text-align: center;
                color:white;
            }
            .card-3{
                height: 350px;
                width: 33%;
                float: right;
                margin: auto;
                border: 1px solid black;
            }
        </style>

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
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
                <table id="customers">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Total from Membership Fees</th>
                        <th scope="col">Total Amount</th>
                    </tr>
                    <%ResultSet rs5 = st.executeQuery("select * from associationAccount order by id desc");
                        while (rs5.next()) {

                    %>
                    <tr>
                        <td><%=rs5.getInt(1)%></td>
                        <td><%=sum%></td>
                        
                        <td><%=rs5.getString(2)%></td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <div class="card-2">
                <% ResultSet rs1 = st.executeQuery("select * from fundsdetails"); %>
                <br> <h3 style="color:yellow;">Fund details Update</h3><!-- comment --><br>
                <form action="associatioAccountAction.jsp" method="post">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">FundId</label>
                        <div class="col-sm-6">
                            <select class="custom-select"  name="fundId" required>
                                <% while (rs1.next()) {%>
                                <option value="<%=rs1.getInt(1)%>"><%=rs1.getInt(1)%></option>
                                <% }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Fund Cost</label>
                        <div class="col-sm-6">
                            <input type="number" class="form-control" name="fundcost" placeholder="Total Fund Cost" required>
                        </div>
                    </div>
                    <br>
                    <div class="button">
                        <button type="submit" class="btn btn-success col-sm-3">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-danger col-sm-3">Clear</button>
                    </div>   
                </form>

            </div>
            <div class="card-3 table-responsive">
                <table id="customers">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Fund Id</th>
                        <th scope="col">Fund Collection</th>
                        <th scope="col">Fund Cost</th>
                    </tr>
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
                </table>
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
