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
                float: right;
                margin-top: -300px;
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
            String meetingId = request.getParameter("id");
            try {
                Connection conn = ConnectionProvider.getCon();
                Statement st1 = conn.createStatement();
                ResultSet rs1 = st1.executeQuery("select * from meeting where meetingId='" + meetingId + "'");
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
            <div style="color: white; text-align: center; font-size: 30px;">Meeting</div>
            <form action="updateMeetingAction.jsp" method="post">
                <div class="card-student">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Meeting ID</label>
                            <div class="col-sm-7">
                                <label class="col-sm-1 col-form-label"> <%=rs1.getInt(1) %></label>
                                <input type="hidden" name="id" value="<%=rs1.getInt(1) %>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Subject:</label>
                            <div class="col-sm-7">
                                <input type="text"class="form-control" name="subject" placeholder="Meeting Subject" value="<%=rs1.getString(2)%>" required>
                            </div>
                        </div>
                            <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Date:</label>
                            <div class="col-sm-7">
                                <input type="date"class="form-control" name="date" placeholder="date" value="<%=rs1.getString(3)%>" required>
                            </div>
                        </div>
                            <div class="form-group row">
                            <label class="col-sm-4 col-form-label">time:</label>
                            <div class="col-sm-7">
                                <input type="time"class="form-control" name="time" placeholder="time" value="<%=rs1.getString(4)%>" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Description:</label>
                            <div class="col-sm-7">
                                <textarea class="form-control" name="description"><%=rs1.getString(5)%></textarea>
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

    </body>
</html>
