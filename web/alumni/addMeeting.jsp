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
                float: right;
                margin-top: -300px;
            }
            .button{
                width: 250px;
                margin: auto;
                text-align: center;
            }
            .card-student{
                width: 65%;
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
            <div style="color: white; text-align: center; font-size: 30px;">Add Meeting</div>
            <button style="float: right"><a href="editMeeting.jsp">View & Edit Meeting</a></button>
            <form action="addMeetingAction.jsp" method="post">
                <div class="card-student">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Subject:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="subject" placeholder="Meeting Subject" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Date:</label>
                            <div class="col-sm-7">
                                <input type="date" class="form-control" name="date" placeholder="Meeting Date" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Time:</label>
                            <div class="col-sm-7">
                                <input type="time" class="form-control" name="time" placeholder="Meeting Time" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">About Meeting:</label>
                            <div class="col-sm-7">
                                <textarea class="form-control" name="description" type="text" placeholder="Meeting Description" required></textarea>
                            </div>
                        </div>
                        <hr>
                         
                    </div>
                    <div class="button">
                        <button type="submit" class="btn btn-success col-sm-5">Add</button>
                        <button type="reset" class="btn btn-danger col-sm-5">Clear</button>
                    </div>
                </div>
            </form>
            
            <%@include file="../footer.jsp"%>
        </div>
        
    </body>
</html>
