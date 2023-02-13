<%
    session.invalidate();
    response.sendRedirect("blogs.jsp?cId=0");
%>