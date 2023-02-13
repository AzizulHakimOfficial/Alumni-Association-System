<%@page errorPage="../error.jsp" %>
<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<style>
    div.menu {
        background-color: #04AA6D;
        text-align: center;
    }

    div.menu a{
        display: inline-block;
        color: black;
        text-align: center;
        padding: 10px;
        padding-top: 15px;
        padding-bottom: 15px;
        text-decoration: none;
    }

    div.menu a:hover {
        background-color:aquamarine ;
    }

    .dropbtn {
        background-color: #04AA6D;
        color: black;
        padding: 10px;
        padding-top: 15px;
        padding-bottom: 15px;
        font-size: 16px;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #04AA6D;
        font-size: 12px;
        color: black;
        font-weight: bold;
    }
    .dropdown-content a {
        color: black;
        display: block;
    }
    .dropdown-content a:hover {
        background-color: white;
        color: black;
    }
    .dropdown:hover .dropdown-content {
        display: block;
        position: fixed;
        background-color:burlywood ;
    }
    .dropdown:hover .dropbtn {
        background-color: aquamarine;
    }
</style>
<%
    String email = session.getAttribute("email").toString();
    String usertype = session.getAttribute("userType").toString();

%>
<%  try {
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        if (session.getAttribute("email") == null) {
            response.sendRedirect("../login.jsp");
        } else {
        }
    } catch (Exception ex) {
        out.println(ex);
    }
%>
<div class="header">
    <div class="menu">
        <a href="studentHome.jsp">Home</a>
        <a href="alumniPersonalInfo.jsp">Alumni</a>
        <a href="studentsPanel.jsp">Students</a>
        <!--
        <div class="dropdown">
            <button class="dropbtn">Notice Board</button>
            <div class="dropdown-content">
                <a href="admin/addNotice.jsp">Add Notice</a>
                <a href="admin/editNotice.jsp">Edit Notice</a>
            </div>
        </div>-->
        <a href="#.jsp">Profile</a>

        <a href="viewWorkshop.jsp"> Workshop</a>
        <a href="viewJobOpportunity.jsp"> Job/Opportunity</a>

        <a href="contact.jsp">Contact</a>
        <a href="../logout.jsp">Logout</a>
        <a href="../blogs.jsp?cId=0">BlogSite</a>

    </div>
</div>