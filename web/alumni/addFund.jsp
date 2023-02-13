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

            .card-1{
                max-height: 520px;

                float: left;
                border: 1px solid black;
                margin-right: 6px;
            }

            .card-3{
                max-height: 500px;
                width: 39%;
                float: right;
                margin: auto;
                border: 1px solid black;
                color:white;
                text-align: center;
            }

        </style>

    </head>
    <body>  
        <% String AlumniType = session.getAttribute("alumniType").toString();%>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>
            <% if (!"finance Controller".equalsIgnoreCase(AlumniType)) {%>

            <div class="card-1 table-responsive" style="max-width: 100%;">
                <% } %>
                <% if ("finance Controller".equalsIgnoreCase(AlumniType)) {%>

                <div class="card-1 table-responsive" style="max-width: 59%;">
                    <% } %>
                    <div class="Mcard">
                        <h1>Funds</h1>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th scope="col">Fund ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Deadline</th>
                                    <th scope="col">Payment</th>
                                        <% if ("finance Controller".equalsIgnoreCase(AlumniType)) { %>
                                    <th scope="col">Fund Status</th>
                                    <th scope="col">Update</th>
                                        <% }
                                        %>
                                </tr>
                            </thead>
                            <%
                                try {

                                    Connection con = ConnectionProvider.getCon();
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from fundsDetails");
                                    int id = 0;
                                    while (rs.next()) {
                                        id = rs.getInt(1);
                            %>
                            <tbody>
                                <tr>
                                    <td><%=rs.getInt(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                    <td>
                                        <a href="fundsPayment.jsp?id=<%=id%>">Payment</a>
                                    </td>
                                    <% if ("finance Controller".equalsIgnoreCase(AlumniType)) {%>
                                    <td><%=rs.getString(6)%></td>
                                    <td>
                                        <a href="updateFund.jsp?id=<%=id%>">Update</a>
                                        <a href="deleteFund.jsp?id=<%=id%>">Delete </a>
                                    </td>
                                    <% }
                                    %>

                                </tr>
                                <%}
                                    } catch (Exception e) {
                                        System.out.println(e);
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <% if ("finance Controller".equalsIgnoreCase(AlumniType)) { %>
                <div class="card-3">
                    <div style="color: white; text-align: center; font-size: 30px;">Add Funds</div>
                    <form action="addFundAction.jsp" method="post">
                        <div class="card-student">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Fund Name</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" name="fName" placeholder="Enter Fund Name" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Description:</label>
                                    <div class="col-sm-7">
                                        <textarea class="form-control" name="fDescription" type="text" placeholder="Enter Fund Description" required></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Amount</label>
                                    <div class="col-sm-7">
                                        <input type="number" class="form-control" name="fAmount" placeholder="Amount" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Deadline</label>
                                    <div class="col-sm-7">
                                        <input type="date" class="form-control" name="fDate" placeholder="Deadline" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 col-form-label">Status:</label>
                                    <div class="col-sm-7">
                                        <select class="custom-select" name="fStatus" required>
                                            <option selected value="Scheduled">Scheduled</option>
                                            <option value="Completed">Completed</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="button">
                                <button type="submit" class="btn btn-success">Add Fund</button>
                                <button type="reset" class="btn btn-danger">Clear</button>
                            </div>
                        </div>
                    </form>
                </div>
                <%}%>
                <%@include file="../footer.jsp"%>
            </div>
    </body>
</html>
