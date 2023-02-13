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
        <%
            //int noticeId = Integer.parseInt(request.getParameter("id"));
            String eventId = request.getParameter("id");
            try {
                Connection conn = ConnectionProvider.getCon();
                Statement st1 = conn.createStatement();
                ResultSet rs1 = st1.executeQuery("select * from event where eventId='" + eventId + "'");
                while (rs1.next()) {
        %>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>
            <div style="color: white; text-align: center; font-size: 30px;">Event</div>
            <form action="updateEventAction.jsp" method="post">
                <div class="card-student">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-4">Event ID</label>
                            <div class="col-sm-7">
                                <label> <%=rs1.getInt(1)%></label>
                                <input type="hidden" name="id" value="<%=rs1.getInt(1)%>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4">Type</label>
                            <div class="col-sm-7">
                                <label> <%=rs1.getString(2)%></label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4">Title</label>
                            <div class="col-sm-7">
                                <label > <%=rs1.getString(3)%></label>
                              
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Date</label>
                            <div class="col-sm-7">
                                <input type="date" class="form-control" name="date" placeholder="Select Event Date" value="<%=rs1.getString(4)%>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Time</label>
                            <div class="col-sm-7">
                                <input type="time" class="form-control" name="time" placeholder="Enter Event Time" value="<%=rs1.getString(5)%>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Venue</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="venue" placeholder="Enter Event Venue" value="<%=rs1.getString(6)%>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Description:</label>
                            <div class="col-sm-7">
                                <textarea class="form-control" name="description"><%=rs1.getString(7)%></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Status:</label>
                            <div class="col-sm-7">
                                <select class="custom-select" name="status" required>
                                    <option selected value="Scheduled">Scheduled</option>
                                    <option value="Completed">Completed</option>
                                </select>
                            </div>
                        </div>
                    </div>
                            
                    <hr>
                    <div class="button">
                        <button type="submit" class="btn btn-success col-sm-5">Update</button>&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-danger col-sm-5">Clear</button>
                    </div>
                </div>
            </form>
            <%}
                } catch (Exception e) {
                    System.out.println(e);
                }

            %>
            <%@include file="../footer.jsp"%>
        </div>
    </div>
</body>
</html>
