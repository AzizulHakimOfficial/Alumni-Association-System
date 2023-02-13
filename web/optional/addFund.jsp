<%-- 
    Document   : adminHome
    Created on : Oct 22, 2022, 12:45:37 PM
    Author     : Azizul Hakim'PC
--%>

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

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>

            <div style="color: white; text-align: center; font-size: 30px;">Add Funds</div>
            <button style="float: right"><a href="editFund.jsp">View & Edit Funds</a></button>
            
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
                        <button type="submit" class="btn btn-success col-sm-5">Add Fund</button>&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-danger col-sm-5">Clear</button>
                    </div>
                </div>
            </form>
            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
