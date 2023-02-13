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
            .message{
                color: yellow;
                width: 200px;
                height: 100px;
                margin-top: -700px;
                float: right;
            }
            .button{
                width: 250px;
                margin: auto;
                text-align: center;
            }
            .card-student{
                width: 60%;
                margin: auto;
            }
            label{
                text-align: center;
                color: white;
            }
            
            .card-1{
                max-height: 540px;
                max-width: 59%;
                float: left;
                border: 1px solid black;
                margin-right: 6px;
            }

            .card-3{
                max-height: 540px;
                width: 39%;
                float: right;
                margin: auto;
                border: 1px solid black;
                color:white;
                text-align: center;
            }
        </style>
        <script type="text/javascript">
            function methodCheck()
            {
                var online = document.getElementById("event");
                var offline = document.getElementById("meeting");
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
        <% String AlumniType = session.getAttribute("alumniType").toString();%>
        <div class="container">
            <div class="header" >
                <%@include file="headerAlumni.jsp"%>
            </div>
            <hr>
            <div class="card-1 table-responsive">
                <div style="color: white; text-align: center; font-size: 30px;">Events</div>
                <div class="Mcard">
                    <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                        <tr style="padding:2px;">
                            <th scope="col">ID</th>
                            <th scope="col">Type</th>
                            <th scope="col">Title</th>
                            <th scope="col">Date</th>
                            <th scope="col">Time</th>
                            <th scope="col">Venue</th>
                            <th scope="col">Event Status</th>
                                <% if ("Event Controller".equalsIgnoreCase(AlumniType)) { %>

                            <th scope="col">Status</th>
                                <% }
                                %>
                                <% if ("Finance Controller".equalsIgnoreCase(AlumniType)) { %>
                            <th scope="col">Add fund for event</th>
                                <% }
                                %>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            try {

                                Connection con = ConnectionProvider.getCon();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from event");
                                int id = 0;
                                while (rs.next()) {
                                    id = rs.getInt(1);
                        %>
                        <tr>

                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(8)%></td>
                            <% if ("Event Controller".equalsIgnoreCase(AlumniType)) {%>

                            <td>
                                <a href="updateEvent.jsp?id=<%=id%>">Update</a>
                                <a href="deleteEvent.jsp?id=<%=id%>">Delete </a>
                            </td>
                            <% }
                            %>
                            <% if ("Finance Controller".equalsIgnoreCase(AlumniType)) {%>
                            <td><a href="addEventFund.jsp?eventId=<%=id%>">Click to Add Fund</a></td>
                            <% }
                            %>

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
                <div style="text-align: center; font-size: 30px;">Add Event</div>

                <form action="addEventAction.jsp" method="post">
                    <div class="">
                        <div class="card-body">
                            <div class="row" style="color:white;">
                                <label class="col-sm-4">Event Type</label>
                                <div class="form-group col-2">
                                    <input type="radio" name="type" id="event" value="Event"> Event
                                </div>
                                <div class="form-group col-2">
                                    <input type="radio" name="type" id="meeting" value="Meeting"> Meeting
                                </div>
                                <div class="form-group col-3">
                                    <input type="radio" name="type" id="workshop" value="Workshop"> Workshop
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Title</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="name" placeholder="Enter Event Name" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Date</label>
                                <div class="col-sm-7">
                                    <input type="date" class="form-control" name="date" placeholder="Select Event Date" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Time</label>
                                <div class="col-sm-7">
                                    <input type="time" class="form-control" name="time" placeholder="Enter Event Time" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Venue</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" name="venue" placeholder="Enter Event Venue" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Description:</label>
                                <div class="col-sm-7">
                                    <textarea class="form-control" name="description" type="text" placeholder="Enter Event Description" required></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label">Status:</label>
                                <div class="col-sm-7">
                                    <select class="custom-select" name="status" required>
                                        <option selected value="Scheduled">Scheduled</option>
                                        <option value="Completed">Completed</option>
                                    </select>
                                </div>
                            </div>
                            <div class="button">
                                <button type="submit" class="btn btn-success col-sm-5">Add Event</button>&nbsp;&nbsp;
                                <button type="reset" class="btn btn-danger col-sm-5">Clear</button>
                            </div>
                        </div>
                        <hr>

                    </div>
                </form>
            </div>


            <%@include file="../footer.jsp"%>
        </div>
    </body>
</html>
