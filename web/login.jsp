
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <div class="conatiner-fluid mt-3">
        <%@include file="admin/message.jsp" %>
    </div>
    <style>
        body{
            background-color: #ddd497;
            background-image: url("images/index.png");
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            position: relative;
        }
        .container{
            width: 100vw;
            height: 98vh;
            
            background-size: 100%;
            margin: auto;
            margin-top: -5px;
            
        }
        #foot{
            margin-top: 30px;
        }
        .login-title{
            color: white;
            font-style: oblique;
            text-align: center;
        }
        .card-admin{
            box-shadow: 10px 10px 5px lightslategray;
            height: 370px;
            width: 35%;
            float: left;
            margin-left: 80px;
            border: 1px solid black;
        }
        .card-alumni{
            box-shadow: 10px 10px 5px lightslategray;
            height: 370px;
            width: 35%;
            float: right;
            margin: auto;
            margin-right: 80px;
            border: 1px solid black;
        }
        h1,label{
            text-align: center;
            color: white;
        }
        label{
            text-shadow:2px 2px 5px black;
        }
        .button{
            text-align: center;
        }
        a{
            font-size: 18px;
            margin-left: 30px;
            color: yellow;
        }
    </style>
</head>

<body>
    <div class="container"> 
        <h1 class="login-title">Login</h1>
        <hr>
        <div class="card-admin">
            <h1 style="color:yellow;text-shadow:2px 2px 5px red;">Admin</h1>
            <div class="card-body">
                <form action="adminLoginAction.jsp" method="post">
                    <div class="form-group row">
                        <label for="staticEmail" class="col-sm-3 col-form-label">Username:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="email" placeholder="Enter admin username" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword" class="col-sm-3 col-form-label">Password:</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" name="password" placeholder="Enter admin password" required>
                        </div>
                    </div>
                    <br><br>
                    <div class="button">
                        <button type="submit" class="btn btn-success"> Login</button>
                        <button type="reset" class="btn btn-danger">Clear</button>
                    </div><!-- comment -->
                </form>
            </div>
        </div>
        <div class="card-alumni">
            <h1 style="color:yellow;text-shadow:2px 2px 5px red;">Alumni/Students</h1>
            <div class="card-body">
                <form action="loginAction.jsp" method="post">
                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Username:</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="emailStudent" placeholder="Enter username" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label  class="col-sm-4 col-form-label">Password:</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="passwordStudent" placeholder="Enter password" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">User Type:</label>
                        <div class="col-sm-7">
                            <select class="custom-select" name="userType" required>
                                <option selected value="alumni">Alumni</option>
                                <option value="student">Student</option>
                            </select>
                        </div>
                    </div>
                    <a href="signupAsAlumni.jsp" style="text-shadow:2px 2px 5px black;" >Signup as Alumni</a>
                    <br>
                    <a href="signupAsStudent.jsp" style="text-shadow:2px 2px 5px black;">Signup as Student</a>
                    <a href="forgotPassword.jsp" style="text-shadow:2px 2px 5px black;">Forgot Password</a>
                    <div class="button">
                        <br>
                        <button type="submit" class="btn btn-success">Login</button>
                        <button type="reset" class="btn btn-danger">Clear</button>
                    </div>
                </form>
            </div>
        </div>
        <div id="foot">
            <%@include file="footer.jsp"%>
        </div>

    </div>
</body>
</html>
