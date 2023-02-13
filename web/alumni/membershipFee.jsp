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
                float: left;
                width: 60%;
                border: 1px black solid;
            }
            .card-2{
                padding:10px;
                float: right;
                width: 39%;

                border: 1px black solid;
            }
            .card-2 h1{
                color: yellowgreen;

            }
            .button{
                width: 250px;
                margin: auto;
                text-align: center;
            }
            label{
                text-align: center;
                color: white;
            }

        </style>
        <script type="text/javascript">
            function methodCheck()
            {
                var online = document.getElementById("onn");
                var offline = document.getElementById("offf");
                var ontext = document.getElementById("on");
                var offtext = document.getElementById("off");
                ontext.disabled = online.checked ? false : true;
                offtext.disabled = offline.checked ? false : true;
                ontext.value = "";
                offtext.value = "";
                if (!ontext.disabled) {
                    ontext.focus();
                }
                if (!offtext.disabled) {
                    offtext.focus();
                }

            }
        </script>

    </head>
    <body>  

        <% String AlumniType = session.getAttribute("alumniType").toString();%>
        <% String emailA = session.getAttribute("email").toString();%>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>

            <h1>Membership Fee Details</h1>
            <div class="card-1 table-responsive">
                <div class="Mcard">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                            <tr>
                                <% if ("finance Controller".equalsIgnoreCase(AlumniType)) { %>
                                <th scope="col">Email</th>
                                    <% }
                                    %>
                                <th scope="col">Month</th>
                                <th scope="col">Amount</th>
                                <th scope="col">Payment Method</th>
                                <th scope="col">Email/Transaction Id</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Connection con = ConnectionProvider.getCon();
                                    Statement st = con.createStatement();
                                    ResultSet rs;
                                    if ("finance controller".equalsIgnoreCase(AlumniType)) {
                                        rs = st.executeQuery("select * from membershipFee");
                                    } else {
                                        rs = st.executeQuery("select * from membershipFee where email='" + emailA + "'");
                                    }
                                    int id = 0;
                                    while (rs.next()) {
                                        id = rs.getInt(1);
                            %>
                            <tr>

                                <% if ("finance Controller".equalsIgnoreCase(AlumniType)) {%>
                                <td><%=rs.getString(10)%></td>
                                <% }
                                %>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(8)%></td>
                                <td><%=rs.getString(5)%></td>

                                <% if ("Online".equalsIgnoreCase(rs.getString(5))) {%>
                                <td><%=rs.getString(7)%></td>
                                <%} else if ("Offline".equalsIgnoreCase(rs.getString(5))) {%>
                                <td><%=rs.getString(6)%></td>
                                <%  }
                                %>
                                <% if ("finance Controller".equalsIgnoreCase(AlumniType)) {%>
                                <td><a href="membershipFeeUpdateAction.jsp?id=<%=id%>&status=<%=rs.getString(9)%>" title="Click to change status" onclick="return confirm('Are you sure you want to change?');"><%=rs.getString(9)%></a></td>
                                    <%  } else if (!"finance Controller".equalsIgnoreCase(AlumniType)) {%>
                                <td><%=rs.getString(9)%></td>
                                <%}
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
            <div class="card-2">
                <form action="membershipFeeAction.jsp" method="post">
                    <div class="card-student">
                        <div class="card-body">
                            <input type="hidden" name="email" value="<%=emailA%>">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Fees-Month</label>
                                <div class="col-sm-7">
                                    <select class="custom-select" name="month" required>
                                        <option value="January">January</option>
                                        <option value="February">February</option>
                                        <option value="March">March</option>
                                        <option value="April">April</option>
                                        <option value="May">May</option>
                                        <option value="June">June</option>
                                        <option value="July">July</option>
                                        <option value="August">August</option>
                                        <option value="September">September</option>
                                        <option value="October">October</option>
                                        <option value="November">November</option>
                                        <option value="December">December</option>
                                    </select>

                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Payment Date</label>
                                <div class="col-sm-7">
                                    <input type="date" class="form-control" name="date" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Payment Time</label>
                                <div class="col-sm-7">
                                    <input type="time" class="form-control" name="time" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Amount</label>
                                <div class="col-sm-7">
                                    <input type="number" class="form-control" name="amount" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Payment Method</label>
                                <div class="form-group col-3">
                                    <input type="radio" name="method" id="onn" value="Online" onClick="methodCheck()"> Online Payment
                                </div>
                                <div class="form-group col-3">
                                    <input type="radio" name="method" id="offf" value="Offline" onClick="methodCheck()"> Offline Payment
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Transaction Id</label>
                                <div class="col-sm-7">
                                    <input type="text" id="on" class="form-control" name="transactionId" disabled="disabled" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Payment BY</label>
                                <div class="col-sm-7">
                                    <input type="email" id="off" class="form-control" name="paymentBy" placeholder="Enter email of who took your payment"  disabled="disabled" >
                                </div>
                            </div>

                            <input type="hidden" name="status" value="Pending">

                        </div>
                        <hr>
                        <div class="button">
                            <button type="submit" class="btn btn-success col-sm-5">Submit</button>&nbsp;&nbsp;&nbsp;
                            <button type="reset" class="btn btn-danger col-sm-5">Clear</button>
                        </div>
                    </div>
                </form>
            </div>
            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
