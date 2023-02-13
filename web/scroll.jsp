<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<style>
    .style26 {
        color: black;
        font-weight:normal;
        
    }
    h5{
        color: white;
        font-size: 15px;
    }
    h6{
        font-size: 15px;
    }
</style>

            <div height="50" align="justify" class="style26">
                <marquee behavior="scroll" direction="up" scrollamount="3">
                    <%
                        int i=1;
                        try {
                            Connection con = ConnectionProvider.getCon();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from notice");
                            while (rs.next()) {
                    %>
                    <h5>Notice: <%=i++%></h5>
                    <h6>Notice Subject: <%=rs.getString(2)%></h6>
                    <h6>Description: </h6><%=rs.getString(3)%>
                    <%}
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </marquee>
            </div>
