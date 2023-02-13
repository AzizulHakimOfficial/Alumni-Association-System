<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String alumniemail = request.getParameter("email");
    String password = request.getParameter("password");
    int mobileNumber = Integer.parseInt(request.getParameter("mobile"));
    String securityQuestion = request.getParameter("securityQuestion");
    String ownquestion = request.getParameter("ownquestion");
    String admissionSession = request.getParameter("admission");
    String passingSession = request.getParameter("passing");
    String dept = request.getParameter("dept");
    String answer = request.getParameter("answer");
    String studentId = request.getParameter("studentId");
    String employeeStatus = request.getParameter("employeeStatus");
    String comName = request.getParameter("comName");
    String designation = request.getParameter("designation");
    String jobYear = request.getParameter("job");
    String AlumniType = request.getParameter("alumniType");
    String status = request.getParameter("status");
    String question = null;
    int check = 0;
    if (ownquestion != null) {
        question = ownquestion;
    } else {
        question = securityQuestion;
    }
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from student where email='" + alumniemail + "'");
        while (rs.next()) {
            check = 1;
            response.sendRedirect("signupAsAlumni.jsp?msg=User Already exist with this email.Please use another Email to Signup.");
        }
        if (check == 0) {
            PreparedStatement ps = con.prepareStatement("insert into alumni values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, alumniemail);
            ps.setString(2, name);
            ps.setInt(3, mobileNumber);
            ps.setString(4, admissionSession);
            ps.setString(5, passingSession);
            ps.setString(6, question);
            ps.setString(7, answer);
            ps.setString(8, password);
            ps.setString(9, studentId);
            ps.setString(10, dept);
            ps.setString(11, employeeStatus);
            ps.setString(12, comName);
            ps.setString(13, designation);
            ps.setString(14, jobYear);
            ps.setString(15, AlumniType);
            ps.setString(16, status);

            ps.executeUpdate();
            response.sendRedirect("signupAsAlumni.jsp?msg=AlumniAddedSuccessfully");
        }
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("signupAsAlumni.jsp?msg=AlumniAddedUnsuccessful.Try Again!!!");
    }

%>