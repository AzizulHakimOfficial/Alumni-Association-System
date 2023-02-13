<%-- 
    Document   : register
    Created on : Oct 5, 2022, 7:24:24 PM
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
        <style>
            body{
                background-color: #18184e;
            }
            .container{
                width: 100vw;
                height: 100vh;
                background-image: url("images/Home1.png");
                background-size: 100%;
                margin: auto;
                background-repeat: no-repeat;
            }
            h2,label{
                text-align: center;
                color: white;
            }
            .card-student{
                height: 380px;
                width: 50%;
                margin: auto;
            }

            .button{
                text-align: center;
                margin-left: 150px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <h2 class="login-title">Forgor Password</h2>
            <h2 style="color:yellow ">Alumni/Student</h2>
            <form action="" method="post">
                <div class="card-student">
                    <div class="card-body">
                        
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Email:</label>
                            <div class="col-sm-7">
                                <input type="email" class="form-control" id="email" placeholder="Enter Email(username)" required>
                            </div>
                        </div><!-- comment -->
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Mobile:</label>
                            <div class="col-sm-7">
                                <input type="number" class="form-control" id="mobile" placeholder="Enter Mobile Number" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Student ID:</label>
                            <div class="col-sm-7">
                                <input type="number" class="form-control" id="studentId" placeholder="Enter Your Student ID" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Security Question:</label>
                            <div class="col-sm-7">
                                <select class="custom-select" name="question" required>
                                    <option selected value="What was your first car?">What was your first car?</option>
                                    <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                                    <option value="What elementary school did you attend?">What elementary school did you attend?</option>
                                    <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Answer:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="answer" placeholder="Enter Your answer" required>
                            </div>
                        </div>
                        <div class="form-group row">
                        <label class="col-sm-4 col-form-label">New Password:</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" id="newPassword" placeholder="Enter Your New password" required>
                        </div>
                    </div>

                    </div>
                    <div class="button">
                        <button type="submit" class="btn btn-success col-sm-3">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-danger col-sm-3">Clear</button>
                    </div>
                </div>

            </form>
        </div>
    </body>
</html>
