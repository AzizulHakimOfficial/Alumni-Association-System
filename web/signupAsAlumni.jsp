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
                background-color: #ddd497;
            }
            .container{
                background-image: url("images/blue-bg.png");
                height: 100%;
                background-position: center;
                background-size:cover;
                background-repeat: no-repeat;
                position: relative;
            }
            .container:hover{
                border: 1px solid black;
            }
            h2,label{
                text-align: center;
                color: white;
            }
            .card-alumni1{
                height: 380px;
                top: 80px;
                width: 45%;
                float: left;
                margin-left: 40px;
                position: absolute;
                margin: auto;
            }
            .card-alumni2{
                height: 400px;
                width: 50%;
                float: right;
                margin-top:  50px;

            }
            .button{
                text-align: center;
                margin-left: 140px;
            }

        </style>
        <script src="scripts/general.js"></script>
    </head>
    <body>
        <div class="container">
            <h2 class="login-title">Register / SignUp</h2>
            <h2 style="color:yellow ">Alumni Register</h2>
            <hr>
            <div align="left"><span><FONT  face="Verdana, Arial, Helvetica, sans-serif"> <script language="JavaScript" type="text/javascript">
                        document.write(TODAY);</script></FONT></span><BR>
            </div>
            
            <form action="signupAsAlumniAction.jsp" method="post" name="register">
                <div class="card-alumni1">

                    <div class="card-body">

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Name:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="name" placeholder="Enter Your Name" required>
                                
                            </div>
                        </div>
                        <input type="hidden" name="alumniType" value="Alumni">
                        <input type="hidden" name="status"  value="notVerified">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Mobile:</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" name="mobile" placeholder="Enter Mobile Number" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Email:</label>
                            <div class="col-sm-8">
                                <input type="email" class="form-control" name="email" placeholder="Enter Email(username)" required>
                            </div>
                        </div><!-- comment -->
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Admission Session</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="admission" placeholder="Enter admission Session as spring 2001" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Passing Session</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="passing" placeholder="Enter passing Session as spring 2001" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Department:</label>
                            <div class="col-sm-8">
                                <select class="custom-select" name="dept" required>
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
                            <label class="col-sm-4 col-form-label">Security Question:</label>
                            <div class="col-sm-8">
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
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="ownquestion" required disabled>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Answer:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="answer" placeholder="Enter Your answer" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-alumni2">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Student ID:</label>
                        <div class="col-sm-7">
                            <input type="number" class="form-control" name="studentId" placeholder="Enter Your Student ID" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Password:</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="password" placeholder="Enter Your password" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Are You Employed?</label>
                        <div class="col-sm-7">
                            <select class="custom-select" name="employeeStatus" required>
                                <option selected value="YES">YES</option>
                                <option value="NO">NO</option>
                            </select>
                            <small id="employee" class="form-text text-muted">If you select No then put N/A in boxes down below</small>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Company Name:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="comName" placeholder="Enter Your Company name" required>

                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Designation:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="designation" placeholder="Enter Your Designation" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">Job Allocation Year: </label>
                        <div class="col-sm-7">
                            <input type="number" class="form-control" name="job" placeholder="Enter Your job allocation year" required>
                            <small id="company" class="form-text text-muted">If you are selected No then put 0000 here</small>
                        </div>
                    </div>
                    <input type="hidden" name="status" value="not verified">
                    <div class="button">
                        <button type="submit" class="btn btn-success col-sm-3">Sign Up</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-danger col-sm-3">Clear</button>
                    </div>
                </div>
                <br>
            </form>
            
            <br>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
