<%@page errorPage="../error.jsp" %>
<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <div class="conatiner-fluid mt-3">
        <%@include file="../admin/message.jsp" %>
    </div>
    <style>
        body{
            background-color: #ddd497;
        }
        .container{
            width: 100vw;
            height: 100vh;
            background-image: url("../images/blue-bg.png");
            background-size: 100%;
        }
        .login-title{
            color: white;
            font-style: oblique;
            text-align: center;
        }
        .card-1{
            height: 300px;
            width: 35%;
            float: left;
            margin-left: 30px;
            border: 1px solid black;
        }
        .card-2{
            height: 300px;
            width: 35%;
            float: left;
            margin: auto;
            margin-left: 30px;
            margin-top: 20px;
            border: 1px solid black;
        }
        .card-3{
            height: 620px;
            width: 50%;
            float: right;
            margin: auto;
            margin-right: 20px;
        }
        h1,label{
            text-align: center;
            color: white;
            padding: 0px;
        }
        .card{
            background-image: url("../images/blue-bg.png");
            padding-left: 20px;

            
        }

        .innerCard{
            text-align: center;
        }
        .button{
            text-align: center;
        }
        a{
            font-size: 18px;
            margin-left: 30px;
            color: yellow;
        }
        label{
            text-align: left;
        }
    </style>
</head>

<body>
    <% String AlumniType = session.getAttribute("alumniType").toString();%>
    <% String emailA = session.getAttribute("email").toString();%>

    <% try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from alumni where email='" + emailA + "'");
            while (rs.next()) {
    %>

    <div class="card-1">
        <h6>Notifications</h6>
        <div class="card">

        </div>
    </div>
    <div class="card-3">
        <h6>Profile</h6>
        <div class="card">

                <label class="col-sm-6 col-form-label" style="font-size: 35px "><%=rs.getString(2)%></label>
                <div class="form-group row">
                    <label class="col-sm-3">Student Id</label>
                    <label class="col-sm-3"><%=rs.getString(9)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Mobile</label>
                    <label class="col-sm-3"><%=rs.getInt(3)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Admission session</label>
                    <label class="col-sm-3"><%=rs.getString(4)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Passing session</label>
                    <label class="col-sm-3"><%=rs.getString(5)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Security Question</label>
                    <label class="col-sm-4"><%=rs.getString(6)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Department</label>
                    <label class="col-sm-3"><%=rs.getString(10)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Employee Status</label>
                    <label class="col-sm-3"><%=rs.getString(11)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Company Name</label>
                    <label class="col-sm-3"><%=rs.getString(12)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Designation</label>
                    <label class="col-sm-3"><%=rs.getString(13)%></label>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3">Job joining Date:</label>
                    <label class="col-sm-3"><%=rs.getString(14)%></label>
                </div>

        </div>
    </div>
    <div class="card-2">
        <h6>Messages</h6>

    </div>

    <%@include file="../footer.jsp"%>
    <%}
        } catch (Exception e) {
        }
    %>
</body>
</html>
