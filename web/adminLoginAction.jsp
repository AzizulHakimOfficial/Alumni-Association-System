<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
        session.setAttribute("email", email);
        response.sendRedirect("admin/adminHome.jsp");
    }else if("admin@gmail.com".equals(email) && !"admin".equals(password)) {
        response.sendRedirect("login.jsp?msg=invalid");
    }
    else if(!"admin@gmail.com".equals(email) && "admin".equals(password)) {
        response.sendRedirect("login.jsp?msg=invalid");
    }else{
        response.sendRedirect("login.jsp?msg=notexist");
    }
%>

<%/*int z = 0;
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
            while (rs.next()) {
                z = 1;
                session.setAttribute("email", email);
                response.sendRedirect("home.jsp");
            }
            if (z != 1){
                response.sendRedirect("login.jsp?msg=notexist");
            }
        }catch(Exception e){
        System.out.println(e);
        response.sendRedirect("login.jsp?msg=invalid");
        }*/%>