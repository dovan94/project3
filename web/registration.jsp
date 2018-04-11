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
        <title>Sign Up</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.9/css/all.css" crossorigin="anonymous">
        <style type="text/css">
            .navbar .navbar-nav {
                margin: 0 auto;
                text-align: center;
                height: 30px;
            }
            .navbar-brand {
                text-transform: none;
                margin: 0 auto;
                color: #3d5c5c;
                letter-spacing: 2px;
                font-family: "Comic Sans MS", cursive, sans-serif;
                font-size: 28pt;
            }
            .navbar-brand:hover {
                color: #3d5c5c;
            }
            li { width: 100px; }
            a {
                text-decoration: none;
                color: grey;
                font-family: "Lucida Console", Monaco, monospace;
                font-weight: bold;
            }
            a:hover {
                color: black;
            }
            .container {
                width: 40%;
                color: #3d5c5c;
                margin-top: 2%;
                font-family: "Comic Sans MS", cursive, sans-serif;
            }
            button {
                background-color: #3d5c5c !important;
                border-color: #3d5c5c !important;
                width: 25%;
            }
            .alert {
                width: 40%;
                margin: 2% auto;
            }
        </style>
    </head>
    <body>
        <!-- Logo -->
        <nav class="navbar navbar-default" style="border-bottom: 1px solid #e6e6e6;">
            <a class="navbar-brand" href="Controller?page=index">DVDs</a>
        </nav>

        <!-- Navigation bar -->
        <nav class="navbar navbar-expand-lg navbar-default" style="border: 1px solid #e6e6e6;">
            <button class="navbar-toggler" type="button" style="border-color: grey;"
                    data-target="#menu" data-toggle="collapse"
                    aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
                <span><i class="fas fa-bars" style="padding-top:15%; color:grey;"></i></span>
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
        
        <% if(null != request.getAttribute("message")) { 
            String message = (String)request.getAttribute("message");
                if (message.equals("success")) {
        %>
                    <div class="alert alert-success">
                        Congratulation! You registered successfully! <br>
                        Click <a href="Controller?page=login" style="font-weight: normal;">here</a> to login!
                    </div>
        <%      } else { %>
                    <div class="alert alert-danger">
                        Username is already exists!
                    </div>
        <%      } 
        } %>
                    
        <div class="container">
            <h1>Sign up</h1>
            <form action="Registration" method="POST" style="margin-top:5%;">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input id="username" name="username" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" name="password" class="form-control"/>
                </div>
                <button type="submit" class="btn btn-primary">Sign Up</button>
            </form>
        </div>
        
    </body>
</html>
