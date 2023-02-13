<%-- 
    Document   : adminHome
    Created on : Oct 22, 2022, 12:45:37 PM
    Author     : Azizul Hakim'PC
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    int alumnicount = 0;
    int Nalumnicount = 0;
    int studentCount = 0;
    int NstudentCount = 0;
    ResultSet rs1, rs2, rs3, rs4;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        rs1 = st.executeQuery("select count(email) from alumni where status='Verified'");
        while (rs1.next()) {
            alumnicount = rs1.getInt(1);
        }
        rs2 = st.executeQuery("select count(email) from student where status='Verified'");
        while (rs2.next()) {
            studentCount = rs2.getInt(1);
        }
        rs3 = st.executeQuery("select count(email) from alumni where status='Not Verified'");
        while (rs3.next()) {
            Nalumnicount = rs3.getInt(1);
        }
        rs4 = st.executeQuery("select count(email) from student where status='Not Verified'");
        while (rs4.next()) {
            NstudentCount = rs4.getInt(1);
        }
    } catch (Exception e) {
    }

    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    map = new HashMap<Object, Object>();
    map.put("label", "Alumni(Verified)");
    map.put("y", alumnicount);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Alumni(Non-Verified)");
    map.put("y", Nalumnicount);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Student(Verified)");
    map.put("y", studentCount);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("label", "Student(Non-Verified)");
    map.put("y", NstudentCount);
    list.add(map);

    String dataPoints = gsonObj.toJson(list);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="../css/commonTableCss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            body{
                background-color: #18184e;
                
            }
            .container{
               background-image: url("../images/future.png");
                height: 100vh;
                background-position: center;
                background-size:cover;
                background-repeat: no-repeat;
                position: relative;
            }
            .container:hover{
                border: 1px solid black;
            }
            .header{
                padding-top: 70px;
            }
            .cardscroll{
                padding-top: 20px;
                float:left;
                height: 60%;
                width: 50%;
            }
            .card-2{
                padding-top: 20px;
                text-align: center;
                position: relative;
            }
            .card-2 h1{
                padding-top: 150px;
                color: yellowgreen;
            }
        </style>
        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "dark1", // "light1", "dark1", "dark2"
                    animationEnabled: true,
                    data: [{
                            type: "pie",
                            toolTipContent: "<b>{label}</b>: {y}",
                            indexLabelFontSize: 14,
                            indexLabel: "  {label} - {y}",
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart.render();

            };
        </script>

    </head>
    <body>  
        <div class="container">
            <div class="header" >
                <%@include file="headerStudent.jsp"%>
            </div>
            <hr>
            <div class="cardscroll table-responsive">
                <%@include file="../scroll.jsp"%>
            </div>
            <div class="card-2">
                <div id="chartContainer" style="max-height: 370px; max-width: 550px;"></div>
                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
            </div>
        </div>
    </body>
</html>
