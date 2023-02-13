<%-- 
    Document   : register
    Created on : Oct 5, 2022, 7:24:24 PM
    Author     : Azizul Hakim'PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <div class="conatiner-fluid mt-3">
        <%@include file="admin/message.jsp" %>
    </div>
    <style>
        body{
            background-color: #18184e;
        }
        .container{
            width: 100vw;
            height: 100%;
            background-image: url("images/blue-bg.png");
            margin: auto;
        }
        h2,label{
            text-align: center;
            color: white;
        }
        .card-student{
            height: 555px;
            width: 60%;
            margin: auto;
            top: 75px;
        }
        .button{
            width: 250px;
            margin: auto;
            text-align: center;
        }
        .message{
            color: yellow;
            width: 200px;
            height: 100px;
            margin-top: -800px;
            float: right;
        }
    </style>
    <script src="scripts/general.js"></script>
</head>
<body>
    <div class="container">

        <h2 class="login-title">Register / SignUp</h2>
        <h2 style="color:yellow ">Student Register</h2>
        <hr>
        <form action="signupAsStudentAction.jsp" method="post" name="register">
            <div class="card-student">
                <div class="card-body">

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Name:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="name" placeholder="Enter Your Name" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Mobile:</label>
                        <div class="col-sm-7">
                            <input type="number" class="form-control" name="mobileNumber" placeholder="Enter Mobile Number" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Email:</label>
                        <div class="col-sm-7">
                            <input type="email" class="form-control" name="email" placeholder="Enter Email(username)" required>
                        </div>
                    </div><!-- comment -->

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Department:</label>
                        <div class="col-sm-7">
                            <select class="custom-select"  name="department" required>
                                <option selected value="CSE">CSE</option>
                                <option value="EEE">EEE</option>
                                <option value="Civil">Civil</option>
                                <option value="BBA">BBA</option>
                                <option value="Textile">Textile</option>
                                <option value="Fashion Design">Fashion Design</option>
                                <option value="Journalism">Journalism</option>
                                <option value="LLB">LLB</option>
                                <option value="English">English</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Student ID:</label>
                        <div class="col-sm-7">
                            <input type="number" class="form-control" name="studentid" placeholder="Enter Your Student ID" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Admission Session</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="admissionSession" placeholder="Enter Session as spring 2001" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Security Question:</label>
                        <div class="col-sm-7">
                            <select class="custom-select" name="securityQuestion" required>
                                <option selected value="What was your first car?">What was your first car?</option>
                                <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                                <option value="What elementary school did you attend?">What elementary school did you attend?</option>
                                <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label"><input type="checkbox" name="checkbox" onClick="check()">
                            Own Question</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="ownquestion" required disabled>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Answer:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="answer" placeholder="Enter Your answer" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Password:</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="password" placeholder="Enter Your password" required>
                        </div>
                    </div>
                    <input type="hidden" name="status"  value="Not Verified">
                </div>
                <div class="button">
                    <button type="submit" class="btn btn-success col-sm-5">Sign Up</button>&nbsp;&nbsp;&nbsp;
                    <button type="reset" class="btn btn-danger col-sm-5">Clear</button>
                </div>
            </div>

        </form>

        <hr>
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
