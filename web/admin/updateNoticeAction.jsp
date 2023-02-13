<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String subject = request.getParameter("subject");
    String description = request.getParameter("description");

    int check=0;
    try{
         Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from notice where noticeId='" + id + "'");
            while (rs.next()){
                check = 1;
                st.executeUpdate("update notice set noticeSubject='" + subject + "',noticeDescription='" + description + "' where noticeId='" + id + "'");
                response.sendRedirect("addNotice.jsp?msg=Selected notice updated successfully.");
            }
           if(check == 0) {
                response.sendRedirect("addNotice.jsp?msg=Selecetd notice updation unsuccessfull!!!");
            }
    } catch (Exception e) {
        System.out.println(e);
    }

%>