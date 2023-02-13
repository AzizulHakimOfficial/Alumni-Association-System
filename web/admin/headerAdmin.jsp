<%@page errorPage="../error.jsp" %>
<style>
    div.menu {
        background-color: #04AA6D;
        text-align: center;
    }

    div.menu a{
        display: inline-block;
        color: black;
        text-align: center;
        padding: 15px;
        text-decoration: none;
    }

    div.menu a:hover {
        background-color:aquamarine ;
    }

    .dropbtn {
        background-color: #04AA6D;
        color: black;
        padding: 15px;
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
<div class="header">
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
    <% String User_email=session.getAttribute("email").toString(); %>
    <div class="menu">
        <a href="adminHome.jsp">Home</a>
         <a href="associationAcc.jsp">Association Account</a>
        <a href="alumniPersonalInfo.jsp">Alumni</a>
        <a href="studentsPanel.jsp">Students</a>
        <a href="addNotice.jsp">Notice Board</a>
      
        <div class="dropdown">
            <button class="dropbtn">Report Generate</button>
            <div class="dropdown-content">
                <a href="../addEventFundReport.jsp">Event Report</a>
                <a href="#">Students Report Generate</a>
            </div>
        </div>
        <a href="contact.jsp">Contact</a>
        <a href="../logout.jsp">Logout</a>


    </div>
</div>