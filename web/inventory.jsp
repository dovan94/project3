<%-- 
    Document   : inventory
    Created on : Apr 10, 2018, 11:18:29 PM
    Author     : VanDo
--%>

<%@page import="servlet.UserBean"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    UserBean userBean = (UserBean)session.getAttribute("userBean"); 
    if (userBean == null) { response.sendRedirect("login.jsp"); }
    String db_driver = "com.mysql.jdbc.Driver";
    String db_url = "jdbc:mysql://localhost:3306/";
    String db_name = "project3";
    String db_user = "root";
//    String db_password = "";
    String db_password = "Venusdo94!";
    try {
        Class.forName(db_driver);
    } catch(ClassNotFoundException e) {
        e.printStackTrace();
    }
    
    Connection conn = null;
    Statement stm = null;
    ResultSet results = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Products</title>
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
            a:hover {
                color: black;
            }
            .container {
                width: 80%;
                margin-top: 3%;
                border-left: 1px solid #d9d9d9;
                border-right: 1px solid #d9d9d9;
            }
            .item {
                padding: 15px;
            }
            .closebtn {
                margin-left: 15px;
                color: #006600;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }
            .closebtn:hover {
                color: white;
            }
            .alert {
                padding: 10px;
                width: 25%;
                margin: 1% auto;
                text-align: center;
            }
            button {
                background-color: #3d5c5c !important;
                border-color: #3d5c5c !important;
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
        
        <% if(null != request.getAttribute("message")) { 
              String message = (String)request.getAttribute("message");
              if (message.equals("success")) {
        %>
                <div class="alert alert-success">Added to cart!</div>
        <%    } else { %>
                <div class="alert alert-info">Item already exists in cart!</div>
        <%    }
            } else { %>
                <div class="alert alert-success">
                    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                    Welcome back, <%= userBean.getUsername() %>
                </div>
        <%  } %>
 
        <div class="container">
            <div class="row text-center" style="display:flex; flex-wrap:wrap;">

        <%  try {
                conn = DriverManager.getConnection(db_url + db_name, db_user, db_password);
                stm = conn.createStatement();
                String query = "SELECT * FROM DVD";
                
                results = stm.executeQuery(query);
                while(results.next()) { 
        %>
        
                <div class="col-lg-3 col-md-4 col-sm-6 item">
                    <div>
                        <img src="<%= results.getString("image") %>" class="img-thumbnail" style="height:200px;"/>
                        <small style="display: block; margin-top: 5px;"><i><%= results.getString("name") %></i></small>
                        <small>$<%= results.getString("price") %></small>
                        <form action="Cart" method="POST">
                            <button type="submit" class="btn btn-primary btn-sm"
                                    name="movie" value="<%= results.getString("id") %>">Add To Cart</button>
                        </form>
                    </div>
                </div>
                    
        <%      }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
            </div> <!-- .row -->     
        </div> <!-- .container -->
       
    </body>
</html>

