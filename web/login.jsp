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
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
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
                margin-top: 2%;
                color: #3d5c5c;
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
        <nav class="navbar navbar-expand-lg navbar-default" style="border-bottom: 1px #e6e6e6 solid;">
            <button class="navbar-toggler" type="button" style="border-color: grey;"
                    data-target="#menu" data-toggle="collapse"
                    aria-controls="menu" aria-expanded="false" aria-label="Toggle navigation">
                <span><i class="fas fa-bars" style="padding-top:15%; color:grey;"></i></span>
            </button>
            <div class="collapse navbar-collapse justify-content-md-center" id="menu">
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
        
        <% if (null != request.getAttribute("message")) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>
                
        <div class="container">
            <h1>Login</h1>
            <form action="Login" method="GET" style="margin-top: 5%;">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input class="form-control" type="text" id="username" name="username"/>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input class="form-control" type="password" id="password" name="password"/>
                </div>

                <button type="submit" class="btn btn-primary">Login</button>
            </form>
        </div>
    </body>
</html>
