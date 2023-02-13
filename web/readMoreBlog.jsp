<%-- 
    Document   : readMoreBlog
    Created on : Jan 1, 2023, 7:14:51 PM
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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/commonTableCss.css">
        <style>
            body{
                background-color: #18184e;
            }
            .container{
                /*background-color: #809966;*/
                height: 100%;
                background-position: center;
                background-size:cover;

                position: relative;
            }
            .container:hover{
             /*   border: 1px solid black;*/
            }
            .header{
                padding-top: 10px;
            }
            .card-body{
                background-color: darkslategray;
                color:white;
            }
            .card .card-footer{
                background-color: tomato;
            }
            .card-img-top{
                max-width: 450px;
                max-height: 350px;
            }
            .card{
                max-width: 600px;
                max-height: 700px;
            }

        </style>

        <!-- Facbook Plugin -->
   <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v15.0" nonce="Z5QQqtHj"></script>
</head>
<body>
    <div class="container">
        <div class="header" >
            <%@include file="blogNavBar.jsp"%>
        </div>
        <hr>
        <%                int posts_id = Integer.parseInt(request.getParameter("post_id"));

            try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from posts where pId='" + posts_id + "'");

        %>
        <div class="card-3 text-center">
            <div class="col offset-md-3">
                <% while (rs.next()) {%>

                <%/*
                    String s = rs.getString(3);
                    s = s.substring(0, Math.min(s.length(), 50));
                    s = s + "...";
                     */%>

                <div class="card">
                    <div class="card-body">
                        <img class="card-img-top" src="blogpic/<%=rs.getString(4)%>" alt="Image not uploaded by the author">
                        <h5 class="display" style="text-align: left;"><%=rs.getString(2)%></h5>
                        <p style="text-align: left;"><%=rs.getString(3)%></p>
                        <p class="card-text"><small class="text-muted">Last updated <%=rs.getString(5)%></small></p>
                    </div>
                    <% }%>
                   <!-- <div class="card-footer text-center primary-background">
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span  class="like-counter"></span></a>
                        <a href="#" class="btn btn-outline-light btn-sm">Read more..</a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><span class="fa fa-commenting-o">20</span></a>
                    </div>-->
                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:8080/AlumniFinalYearProject/readMoreBlog.jsp?post_id=<%=posts_id%>" data-width="550" data-numposts="5"></div>
                    </div>
                </div>
                <% } catch (Exception e) {
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
