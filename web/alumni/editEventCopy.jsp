<%-- 
    Document   : adminHome
    Created on : Oct 22, 2022, 12:45:37 PM
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
            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #customers td, #customers th {
                border: 0.5px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){
                background-color: #f2f2f2;

            }
            #customers tr:nth-child(odd){
                background-color: #ddd;
            }
            #customers tr:nth-child(even):hover{
                background-color:antiquewhite;

            }
            #customers tr:nth-child(odd):hover{
                background-color: antiquewhite;
            }

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color:#ccc;
                color: black;
            }

            #customers a{
                color:blue;
            }
            #customers a:hover{
                color: red;
            }
            .message{
                color: yellow;
                width: 200px;
                height: 100px;
                float: right;
                margin-top: -330px;
            }


        </style>

    </head>
    <body>  
        <div class="container">
            <% try {

                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();%>

            <div style="color: white; text-align: center; font-size: 30px;">Events</div>
            <!--Row-->
            <div class="card-columns">
                <%
                    ResultSet rs = st.executeQuery("select * from event");
                    int id = 0;
                    while (rs.next()) {
                        id = rs.getInt(1);
                %>
                <%String s = rs.getString(7);
                    s = s.substring(0, Math.min(s.length(), 30));
                    s = s + "...";%>

                <div class="card" style="margin-bottom: 10px; max-width: 300px;max-height: 160px;">
                    <h6 class="card-title"><%=rs.getString(2)%></h6>
                    <img class="card-img-top" style="max-width: 280px;max-height: 110px;" src="../images/error404.jpg" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><%=rs.getString(3)%></h5>
                        <h6><%=rs.getString(6)%></h6>
                        <!--<p class="card-text"><small class="text-muted"><%=rs.getString(4)%> <%=rs.getString(5)%> </small></p>-->
                        <p class="card-text"><%=s%></p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                    <div class="card-footer text-center primary-background">

                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span  class="like-counter"></span></a>
                        <a href="show_blog.jsp?po" class="btn btn-outline-light btn-sm">Read more..</a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><span class="fa fa-commenting-o">20</span></a>

                    </div>
                </div>
                <%}
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            </div>
            <%@include file="../footer.jsp"%>
        </div>

    </body>
</html>




