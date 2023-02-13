<%@page import="database.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.jsp">Go to IndexPage</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="blogs.jsp?cId=0">Home <span class="sr-only">(current)</span></a>
            </li>
            <%  try {
                    response.setHeader("Cache-Control", "no-cache");
                    response.setHeader("Cache-Control", "no-store");
                    response.setHeader("Pragma", "no-cache");
                    response.setDateHeader("Expires", 0);
                    if (session.getAttribute("email") != null) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#postmodal"><span class="fa fa-plus"></span> Do Post</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>

                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="blogs.jsp?cId=0">All Categories Post</a>
                    <% try {
                            Connection con1 = ConnectionProvider.getCon();
                            Statement st1 = con1.createStatement();
                            ResultSet rs1 = st1.executeQuery("select * from categories");
                            while (rs1.next()) {
                    %>
                    <a class="dropdown-item" href="blogs.jsp?cId=<%=rs1.getInt(1)%>"><%=rs1.getString(2)%> Post</a>
                    <% }
                        } catch (Exception e) {
                        }
                    %>
                </div>

            </li>
        </ul>

    </div>
    <a class="navbar-brand" href="#">Alumni Association System</a>
</nav>
<%
} else {%>
<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Categories
    </a>

    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item" href="blogs.jsp?cId=0">All Categories Post</a>
        <% try {
                Connection con1 = ConnectionProvider.getCon();
                Statement st1 = con1.createStatement();
                ResultSet rs1 = st1.executeQuery("select * from categories");
                while (rs1.next()) {
        %>
        <a class="dropdown-item" href="blogs.jsp?cId=<%=rs1.getInt(1)%>"><%=rs1.getString(2)%> Post</a>
        <% }
            } catch (Exception e) {
            }
        %>
    </div>

</li>
</ul>

</div>
<a class="navbar-brand" href="login.jsp">Alumni Association System</a>
</nav><%
        }
    } catch (Exception ex) {
        out.println(ex);
    }
%>
<%

%>

