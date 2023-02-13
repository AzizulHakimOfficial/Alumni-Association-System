<%
    String message = request.getParameter("msg");
    if (message != null) {
%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript">
        var timePerriodInMs=3000;
        setTimeout(function(){
            document.getElementById("text-message").style.display="none";
        },
        timePerriodInMs);
    </script>
<div id="text-message" class="alert alert-success">
    <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
    <strong><%=message%></strong>
</div>
<%
        session.setAttribute("msg", null);
    }
%>

