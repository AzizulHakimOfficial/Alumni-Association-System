<%-- 
    Document   : adminHome
    Created on : Oct 22, 2022, 12:45:37 PM
    Author     : Azizul Hakim'PC
--%>
<%@page errorPage="../error.jsp" %>
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
              /*  background-color: #809966;*/

                height: 100%;
                background-position: center;
                background-size:cover;

                position: relative;
            }
            .container:hover{
              /*  border: 1px solid black;*/
            }
            .header{
                padding-top: 10px;
            }

            .card-1{
                height: 350px;
                width: 30%;
                float: left;
                margin-right: 6px;
                border: 1px solid black;
            }

            .card-3{
                
               /*max-height: 360px;
               width: 60%;
                float: right;
                border: 1px solid black;*/
            }
            .card-body{
                background-color: darkslategray;
                color:white;
            }
            .card .card-footer{
                background-color: tomato;
            }
            .card-img-top{
                max-width: 170px;
                max-height: 140px;
            }
            .card{
                max-width: 290px;
                max-height: 350px;
            }
            .card .img{
                text-align: center;
            }
        </style>

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="blogNavBar.jsp"%>
            </div>
            <hr>
            
            <div class="card-3 text-center">

                <div class="row">
                    <div class="card-columns">
                        <%                            
                            int cId = Integer.parseInt(request.getParameter("cId"));
                            ResultSet rs;
                            String Q = null;
                            try {
                                Connection con = ConnectionProvider.getCon();
                                Statement st = con.createStatement();
                                if(cId != 0) {
                                    Q = "select * from posts where catId='" + cId + "' order by pId desc";
                                }else{
                                    Q = "select * from posts order by pId desc";
                                }
                                rs = st.executeQuery(Q);
                                while (rs.next()) {%>

                        <%
                            String s = rs.getString(3);
                            s = s.substring(0, Math.min(s.length(), 50));
                            s = s + "...";
                        %>

                        <div class="card">
                            <div class="card-body">
                                     <img class="card-img-top" src="blogpic/<%=rs.getString(4)%>" alt="Image not uploaded by the author">
                                     <h5 class="display" style="text-align: left;"><%=rs.getString(2)%></h5>
                                <p style="text-align: left;"><%=  s%></p>
                                <p class="card-text"><small class="text-muted">Posted at <%=rs.getString(5)%></small></p>
                            </div>
                            <div class="card-footer text-center">
                               <!-- <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span  class="like-counter"></span></a>
                               --> <a href="readMoreBlog.jsp?post_id=<%=rs.getInt(1)%>" class="btn btn-outline-light btn-sm">Read more..</a>
                               <!-- <a href="#!" class="btn btn-outline-light btn-sm"><span class="fa fa-commenting-o">0</span></a>
-->
                            </div>
                        </div>

                        <% }
                            } catch (Exception e) {
                            }
                        %>
                    </div>
                </div>

            </div>

        </div>


        <!--Post modal starts here-->


        <!-- Modal -->
        <div class="modal fade" id="postmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class=" container text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h5 class="modal-title" id="exampleModalLabel"><span class ="fa fa-plus-square"></span> <br>  Fill the data carefully</h5>

                    </div>


                    <div class="modal-body">

                        <form action="PostServlet" method="post" enctype="multipart/form-data">


                            <div class="form-group">
                                <select class="form-control" name="cId">
                                    <option value="1" selected>1</option>
                                    <option value="2" >2</option>
                                    <option value="3" >3</option>
                                </select>
                            </div>
                            <input type="hidden" name="userId" value="3">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Post Title</label>
                                <input type="text" class="form-control" name="pTitle" placeholder="Enter Title here">
                            </div>

                            <div class="form-group">
                                <label>Post Content</label>
                                <textarea  style="height: 160px" class="form-control" name="pContent" placeholder="Enter description of the post..."></textarea>


                            </div>
                            <div class="form-group">
                                <label>Select Your Pic</label>
                                <br>
                                <div class="custom-file">
                                    <input type="file" class="form-control" name="pPic"/>
                                </div>
                            </div>

                            <div class="container text-center">
                                <button id="postbutton" type="submit" class="btn btn-primary">Post</button>
                            </div>
                        </form>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>



        <!--Post modal ends here-->



    </body>
</html>
