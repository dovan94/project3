<%-- 
    Document   : checkout
    Created on : Apr 9, 2018, 5:54:39 PM
    Author     : VanDo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
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

            li { width: 120px; }
            a {
                text-decoration: none;
                color: grey;
                font-family: "Lucida Console", Monaco, monospace;
                font-weight: bold;
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
                        <a class="nav-link" href="Controller?page=inventory">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?page=checkout">Checkout</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?page=logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <h1>Checkout page!</h1>
        </div>
        
    </body>
</html>
