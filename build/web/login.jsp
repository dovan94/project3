<%-- 
    Document   : login
    Created on : Apr 8, 2018, 2:03:21 PM
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
                    aria-controls="menu" aria-expanded="true" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse justify-content-md-center" id="menu">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="">Home</a>
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
        
        <div class="container">
            <h1>Login</h1>
            <form action="Login" method="GET">
                
                <% if (null != request.getAttribute("message")) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("message") %>
                </div>
                <% } %>
    
                <div class="form-group">
                    <label for="username">Username</label>
                    <input class="form-control" type="text" id="username" name="username"/>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input class="form-control" type="password" id="password" name="password"/>
                </div>

                <input type="submit" value="Login"/>
            </form>
        </div>
    </body>
</html>
