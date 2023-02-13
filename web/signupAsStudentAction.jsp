<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    int mobileNumber = Integer.parseInt(request.getParameter("mobileNumber"));
    String securityQuestion = request.getParameter("securityQuestion");
    String ownquestion = request.getParameter("ownquestion");
    String question = null;
    if (ownquestion != null) {
        question = ownquestion;
    } else {
        question = securityQuestion;
    }
    String answer = request.getParameter("answer");
    String admissionSession = request.getParameter("admissionSession");
    String studentId = request.getParameter("studentid");
    String department = request.getParameter("department");
    String status = request.getParameter("status");

    try {
        int check = 0;
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from alumni where email='" + email + "'");
        while (rs.next()) {
            check = 1;
            response.sendRedirect("signupAsStudent.jsp?msg=User Already exist with this email.Please use another Email to Signup.");
        }
        if (check == 0) {
            PreparedStatement ps = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, name);
            ps.setInt(3, mobileNumber);
            ps.setString(4, department);
            ps.setString(5, studentId);
            ps.setString(6, admissionSession);
            ps.setString(7, question);
            ps.setString(8, answer);
            ps.setString(9, password);
            ps.setString(10, status);

            ps.executeUpdate();
            response.sendRedirect("signupAsStudent.jsp?msg=Succesfully Registered");
        }
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("signupAsStudent.jsp?msg=Registration Unsuccessful.Try Again!");
    }

%>