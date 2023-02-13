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
                margin-top: -100px;
                float: right;
            }
            label{
                text-align: center;
                color: white;
            }
            .card-alumni1{
                height: 100%;
                top: 150px;
                width: 50%;
                float: left;
                margin-left: 40px;
                position: absolute;
                margin: auto;
            }
            .card-alumni2{
                height: 100%;
                width: 50%;
                float: right;
                margin-top:  15px;

            }
            .button{
                text-align: center;
                margin-left: 140px;
            }
        </style>

    </head>
    <body>  
        <%
            //int noticeId = Integer.parseInt(request.getParameter("id"));
            String jobId = request.getParameter("id");
            try {
                Connection conn = ConnectionProvider.getCon();
                Statement st1 = conn.createStatement();
                ResultSet rs1 = st1.executeQuery("select * from job where jobId='" + jobId + "'");
                while (rs1.next()) {
        %>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>
            <div class="conatiner-fluid mt-3">
                <%@include file="../admin/message.jsp" %>
            </div>
            <div style="color: white; text-align: center; font-size: 30px;">Update Job/Opportunity</div>

            <form action="updateJobOpportunityAction.jsp" method="post">
                <div class="card-alumni1">
                    <div class="card-body">

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Job ID</label>
                            <div class="col-sm-7">
                                <label class="col-sm-1 col-form-label"> <%=rs1.getInt(1) %></label>
                                <input type="hidden" name="id" value="<%=rs1.getInt(1) %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Company Name:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="name" placeholder="Enter Company Name" value="<%=rs1.getString(2) %>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Company Profile:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="profile" placeholder="Enter Company Profile" value="<%=rs1.getString(3) %>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Vacancy Position:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="position" placeholder="Enter Vacancy Position" value="<%=rs1.getString(4) %>" required>
                            </div>
                        </div><!-- comment -->
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Description:</label>
                            <div class="col-sm-8">
                                <textarea class="form-control" name="description" type="text" placeholder="Enter Job Description" required><%=rs1.getString(5) %></textarea>
                                 <small id="employee" class="form-text text-muted">Put here the details of company,requirements,how they will apply this job. </small>
                            </div>
                        </div>
                   </div>
                </div>

                <div class="card-alumni2">
                    <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Vacancy Category:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="category" placeholder="Enter Category" value="<%=rs1.getString(6) %>" required>
                            </div> 
                        </div>
                    <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Location:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="location" placeholder="Enter Location" value="<%=rs1.getString(7) %>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Experience:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="experience" placeholder="Enter Experience requirement" value="<%=rs1.getString(8) %>" required>
                                 <small class="form-text text-muted">Example: None / 0 to 1 years / 1 years</small>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Deadline:</label>
                            <div class="col-sm-7">
                                <input type="date" class="form-control" name="deadline" placeholder="Enter Experience requirement" value="<%=rs1.getString(9) %>" required>
                            </div>
                        </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Job Type?</label>
                        <div class="col-sm-7">
                            <select class="custom-select" name="type" required>
                                <option value="Full Time">Full Time</option>
                                <option value="Part Time">Part Time</option>
                                <option value="Constructual">Constructual</option>
                                <option selected value="Internship">Internship</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Email:</label>
                        <div class="col-sm-7">
                            <input type="email" class="form-control" name="email" placeholder="Enter email" value="<%=rs1.getString(11) %>" required>
                        </div>
                    </div>
                    <div class="button">
                        <button type="submit" class="btn btn-success col-sm-3">Update</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-danger col-sm-3">Clear</button>
                    </div>
                </div>

            </form>

            <%@include file="../footer.jsp"%>
            <%}
                } catch (Exception e) {
                    System.out.println(e);
                }

            %>
        </div>
    </body>
</html>
