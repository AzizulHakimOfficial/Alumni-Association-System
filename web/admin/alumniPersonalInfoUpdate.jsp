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
                width: 100px;
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
                width: 20%;
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
            String alumniemail = request.getParameter("email");
        %>

        <div class="container">
            <div class="header" >
                <%@include file="headerAdmin.jsp"%>
            </div>
            <hr>
            <div style="color: white; text-align: center;padding-bottom: 30px; font-size: 30px;">Update Alumni Type and Status</div>
            <div class="card-student">
                <form action="alumniPersonalInfoAction.jsp" method="post">
                <div class="form-group">
                    <input type="hidden" name="email" value="<%=alumniemail%>">
                    <label>Alumni Type:</label>
                    <select class="form-control" name="alumniType">
                        <option value="Alumni">Alumni</option>
                        <option value="President">President</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Verification Status</label>
                    <select class="form-control" name="status">
                        <option value="Not Verified">Not Verified</option>
                        <option value="Verified">Verified</option>
                    </select>
                </div>
                <div class="container text-center">
                    <button type="submit" class="btn-outline-success" >Submit</button>
                    <button type="reset" class="btn-outline-warning">Close</button>
                </div>
            </form>
            </div>
            <%@include file="../footer.jsp"%>
        </div>

    </body>
</html>
