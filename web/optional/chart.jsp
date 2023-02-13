<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>


<!DOCTYPE HTML>
<html>
    <head>
        <%
    int alumnicount = 0;
    int Nalumnicount = 0;
    int studentCount = 0;
    int NstudentCount = 0;
    ResultSet rs1,rs2,rs3,rs4;
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "dark2", // "light1", "dark1", "dark2"
                    animationEnabled: true,
                    data: [{
                            type: "pie",
                            toolTipContent: "<b>{label}</b>: {y}%",
                            indexLabelFontSize: 16,
                            indexLabel: "{label} - {y}%",
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart.render();
            }
        </script>
    </head>
    <body>
        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>
</html>