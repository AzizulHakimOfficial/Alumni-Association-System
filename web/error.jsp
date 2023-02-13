<%@page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <link rel="stylesheet" href="../css/alumniInfoPrint.css">
    <style>
        body
        {
            background-color: #0080FF;
        }
        h1
        {
            color: white;
            text-align: center;
        }
        a
        {
            color:white;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Error</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    </head>
    <body>
        
        <div class="container p-3 text-center">
            
            <img src="../images/error.png" class="img-fluid"/>
            
            <h3>May be you logged out from the system...</h3>
            <h1>Go for login!</h1>
            <br>
            <a class="button" style="size: 50px;" href="../blogs.jsp?cId=0">Go To Blog</a>
            <a class="button" style="size: 50px;" href="../login.jsp">Login</a>
        </div>
    </body>
</html>