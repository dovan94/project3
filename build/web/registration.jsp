<%-- 
    Document   : registration
    Created on : Apr 8, 2018, 2:03:33 PM
    Author     : VanDo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button"
                    data-target="#menu" data-toggle="collapse" 
                    aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="menu">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?page=index">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?page=signup">Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?page=login">Login</a>
                    </li>
                </ul>
            </div>
        </nav>
        <h1>Registration</h1>
        <form action="Registration" method="POST">
            <% if(null != request.getAttribute("message")) { 
                    String message = (String)request.getAttribute("message");
                    if (message.equals("success")) {
            %>
                    <div class="alert alert-success">
                        Congratulation! You registered successfully!
                    </div>
            <%      } else { %>
                    <div class="alert alert-danger">
                        Username is already exists!
                    </div>
            <%      } 
                } %>
            
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control"/>
            </div>
            <input type="submit" value="Sign Up"/>
        </form>
    </body>
</html>
