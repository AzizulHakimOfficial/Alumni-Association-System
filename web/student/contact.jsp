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
                padding: 4px;
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
                padding-top: 6px;
                padding-bottom: 6px;
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
            .card-1{
                height: 300px;
                width: 55%;
                float: left;
                margin-left: 30px;
                border: 1px solid black;
            }
            .card-3{
                height: 300px;
                width: 55%;
                margin-top: 30px;
                float: left;
                margin-left: 30px;
                border: 1px solid black;
            }
            .card-2{
                height: 530px;
                width: 39%;
                float: right;
                margin: auto;
                margin-left: 30px;

                border: 1px solid black;
            }
            .card-2 h1{
                color: yellowgreen;

            }
            .button{
                width: 250px;
                margin: auto;
                text-align: center;
            }
            label{
                text-align: center;
                color: white;
            }

        </style>
        <script type="text/javascript">
            function methodCheck()
            {
                var online = document.getElementById("onn");
                var offline = document.getElementById("offf");
                var ontext = document.getElementById("on");
                var offtext = document.getElementById("off");
                ontext.disabled = online.checked ? false : true;
                offtext.disabled = offline.checked ? false : true;
                ontext.value = "";
                offtext.value = "";
                if (!ontext.disabled) {
                    ontext.focus();
                }
                if (!offtext.disabled) {
                    offtext.focus();
                }

            }
        </script>

    </head>
    <body>  

        <% String emailA = session.getAttribute("email").toString();%>
        <div class="container">
            <div class="header" >
                <%@include file="headerStudent.jsp"%>
            </div>
            <hr>

            <div class="card-1 table-responsive">
                <table id="customers">
                    <tr>
                        <th scope="col">Received - From</th>
                        <th scope="col">Subject</th>
                        <th scope="col">Message</th>
                        <th scope="col">Delete</th>
                    </tr>
                    <% try {

                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from contact where mTo='" + emailA + "' order by contactId desc");
                            int id = 0;
                            while (rs.next()) {
                                id = rs.getInt(1);
                    %>
                    <tr>

                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><a href="deleteContactAction.jsp?contactId=<%=id%>">Delete </a></td>

                    </tr>
                    <%}
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </table>
            </div>

            <div class="card-2">
                <div style="color: white; text-align: center; font-size: 30px;">Contact</div>

                <form action="contactAction.jsp" method="post">
                    <div class="card-student">
                        <div class="card-body">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">From</label>
                                <div class="col-sm-7">
                                    <label class="col-form-label"><%=emailA%></label> 
                                </div>
                                <input type="hidden" class="form-control" name="from" value="<%=emailA%>" required>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">To</label>
                                <div class="col-sm-7">
                                    <select class="custom-select" name="to" required>

                                        <option value="Admin">Admin</option>                                    
                                        <option value="President">President</option>                                    
                                        <option value="Finance Controller">Finance Controller</option>
                                        <option value="Event Controller">Event Controller</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Subject</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="subject" placeholder="Message Subject" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Message</label>
                                <div class="col-sm-7">
                                    <textarea class="form-control" name="message" type="text" placeholder="Message" required></textarea>
                                </div>
                            </div>

                        </div>
                        <hr>
                        <div class="button">
                            <button type="submit" class="btn btn-success col-sm-5">Send</button>&nbsp;&nbsp;&nbsp;
                            <button type="reset" class="btn btn-danger col-sm-5">Clear</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-3 table-responsive">
                <table id="customers">
                    <tr>
                        <th scope="col">Sent - To</th>
                        <th scope="col">Subject</th>
                        <th scope="col">Message</th>
                        <th scope="col">Delete</th>
                    </tr>
                    <%
                        try {

                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from contact where mFrom='" + emailA + "' order by contactId desc ");
                            int id = 0;
                            while (rs.next()) {
                                id = rs.getInt(1);
                    %>
                    <tr>

                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><a href="deleteContactAction.jsp?contactId=<%=id%>">Delete </a></td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </table>
            </div>
            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
