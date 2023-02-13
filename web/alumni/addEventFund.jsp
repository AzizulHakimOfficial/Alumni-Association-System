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

            #customers a{
                color:blue;
            }
            #customers a:hover{
                color: red;
            }
            .message{
                color: yellow;
                width: 200px;
                height: 100px;
                float: right;
                margin-top: -330px;
            }
            .card-1{
                max-height: 580px;

                float: left;
                border: 1px solid black;
                margin-right: 6px;
            }

            .card-3{
                max-height: 580px;
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
        <% String AlumniType = session.getAttribute("alumniType").toString();
            String eventId = request.getParameter("eventId");
        %>
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
                    <div style="color: white; text-align: center; font-size: 30px;">Funds</div>
                    <table id="customers">
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
                        <%
                            try {

                                Connection con = ConnectionProvider.getCon();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from fundsDetails where eventId is not null");
                                int id = 0;
                                while (rs.next()) {
                                    id = rs.getInt(1);
                        %>
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
                                <a href="deleteEventFund.jsp?id=<%=id%>">Delete </a>
                            </td>
                            <% }
                            %>

                        </tr>
                        <%}
                        %>
                    </table>
                </div>
                <% if ("finance Controller".equalsIgnoreCase(AlumniType)) { %>
                <div class="card-3">
                    <div style="color: white; text-align: center; font-size: 30px;">Add Funds</div>
                    <%
                        ResultSet rs1 = st.executeQuery("select * from event where eventId='" + eventId + "'");
                        while (rs1.next()) {
                    %>

                    <form action="addEventFundAction.jsp" method="post">
                        <div class="card-student">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-4">Event ID</label>
                                    <div>
                                        <label><%=eventId%></label>
                                        <input type="hidden" name="eventId" value="<%=eventId%>" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4">Type</label>
                                    <div>
                                        <label><%=rs1.getString(2)%></label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4">Title</label>
                                    <div style="text-align: left; ">
                                        <label><%=rs1.getString(3)%></label>
                                        <input type="hidden" name="fName" value="<%=rs1.getString(3)%>" required>
                                    </div>
                                </div>
                                    <input type="hidden" name="fDescription" value="<%=rs1.getString(7)%>" required>
                             
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
                <%}
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }

                %>

                <%@include file="../footer.jsp"%>
            </div>
    </body>
</html>
