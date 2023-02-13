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
        <link rel="stylesheet" href="../css/commonTableCss.css">
        <%@include file="message.jsp" %>
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
            
            .card-1{
                height: 520px;
                width: 58%;
                float: left;
                margin-right: 6px;
            }

            .card-3{
                height: 360px;
                width: 40%;
                float: right;
                margin: auto;
                border: 1px solid black;
                color:white;
            }
        </style>

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerAdmin.jsp"%>
            </div>

            <hr>
            <div class="card-1 table-responsive">
                <div class="Mcard">
                    <h1>Edit & View Notice</h1>
                    <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                            <tr>
                                <th scope="col">Notice ID</th>
                                <th scope="col">Notice Subject</th>
                                <th scope="col">Notice Description</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    Connection con = ConnectionProvider.getCon();
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from notice");
                                    int id = 0;
                                    while (rs.next()) {
                                        id = rs.getInt(1);
                            %>
                            <tr>

                                <td><%=rs.getInt(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td>
                                    <a href="updateNotice.jsp?id=<%=id%>">Update</a>
                                    <a href="deleteNotice.jsp?id=<%=id%>">Delete </a>
                                </td>
                            </tr>
                            <%}
                                } catch (Exception e) {
                                    System.out.println(e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-3">
                <div style="color: white; text-align: center; font-size: 30px;">Add Notice</div>
                <form action="addNoticeAction.jsp" method="post">
                    <div class="card-student">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Notice Subject:</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="subject" placeholder="Enter Notice Subject" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Notice Description:</label>
                                <div class="col-sm-7">
                                    <textarea class="form-control" name="description" type="text" placeholder="Enter Notice Description" required></textarea>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="button">
                            <button type="submit" class="btn btn-success">Add Notice</button>
                            <button type="reset" class="btn btn-danger">Clear</button>
                        </div>
                    </div>
                </form>
            </div>
            <%@include file="../footer.jsp"%>
        </div>

    </body>
</html>
