<%-- 
    Document   : adminHome
    Created on : Oct 22, 2022, 12:45:37 PM
    Author     : Azizul Hakim'PC
--%>
<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
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
            .message{
                color: yellow;
                width: 200px;
                height: 100px;
                margin-top: -700px;
                float: right;
            }
            .button{
                width: 250px;
                margin: auto;
                text-align: center;
            }
            .card-student{
                width: 60%;
                margin: auto;
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
        <% String Uemail = session.getAttribute("email").toString();
            String fundId = request.getParameter("id");
        %>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>
            <div style="color: white; text-align: center; font-size: 30px;">Payment Info</div>
            <!--<button style="float: right"><a href="editFund.jsp">View & Edit Funds</a></button>-->

            <% try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from fundspayment where email='" + Uemail + "' and fundId='" + fundId + "'");
                    String status = null;
                    String paymentId = null;
                    while (rs.next()) {
                        status = rs.getString(9);
                        paymentId = rs.getString(1);
                    }
            %>

            <form action="fundsPaymentAction.jsp" method="post" name="fundsPayment">
                <div class="card-student">

                    <%
                        if (!"null".equalsIgnoreCase(paymentId) & "Pending".equalsIgnoreCase(status)) {%>
                    <div class="card-body">             
                        <h1>Your Payment info already added.Wait for verification...</h1>
                        <h3>when your payment info verify by the finance controller you will get the update...</h3>     
                    </div> 
                    <% } else if (!"null".equalsIgnoreCase(paymentId) & "Verified".equalsIgnoreCase(status)) {%>
                    <div class="card-body">             
                        <h1>Your Payment is done...</h1>
                        <h3>Thanks for the funding payment</h3>     
                    </div>
                    <% } else{%>

                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Fund ID:</label>
                            <div class="col-sm-7">
                                <label class="col-form-label"><%=fundId%></label>
                                <input type="hidden" name="fId" value="<%=fundId%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Email</label>
                            <div class="col-sm-7">
                                <label class="col-form-label"><%=Uemail%></label>
                                <input name="email" type="hidden" value="<%=Uemail%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Date</label>
                            <div class="col-sm-7">
                                <input type="date" class="form-control" name="date" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Time</label>
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
                    <%
                        }
                    %>

                </div>
                
            </form>
            <%@include file="../footer.jsp"%>
            <%

                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
        </div>
    </body>
</html>
