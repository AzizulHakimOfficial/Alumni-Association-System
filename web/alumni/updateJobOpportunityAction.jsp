<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String cName = request.getParameter("name");
    String cProfile = request.getParameter("profile");
    String vPosition = request.getParameter("position");
    String vCategory = request.getParameter("category");
    String description = request.getParameter("description");
    String location = request.getParameter("location");
    String experience = request.getParameter("experience");
    String deadline = request.getParameter("deadline");
    String type = request.getParameter("type");
    String email = request.getParameter("email");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from job where jobId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("update job set cName='" + cName + "',cProfile='" + cProfile + "',vPosition='" + vPosition + "',description='" + description + "',vCategory='" + vCategory + "',location='" + location + "',experience='" + experience + "',deadline='" + deadline + "',type='" + type + "',email='" + email + "' where jobId='" + id + "'");
                response.sendRedirect("editJobOpportunity.jsp?msg=Selected Job/Opportunity updated successfully.");
            }
           if(check == 0) {
                response.sendRedirect("editJobOpportunity.jsp?msg=Selected Job/Opportunity updation unsuccessfull!!!");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>