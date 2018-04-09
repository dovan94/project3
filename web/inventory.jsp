<%-- 
    Document   : welcome
    Created on : Apr 8, 2018, 1:39:26 PM
    Author     : VanDo
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="servlet.UserBean"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    UserBean userBean = (UserBean)session.getAttribute("userBean"); 
    PrintWriter printer = response.getWriter();
    
    String db_driver = "com.mysql.jdbc.Driver";
    String db_url = "jdbc:mysql://localhost:3306/";
    String db_name = "project3";
    String db_user = "root";
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
        <style type="text/css">
            .navbar {
                margin: 0 auto;
            }
            .navbar .navbar-nav {
                margin: 0 auto;
                text-align: center;
                height: 40px;
            }
            li {
    
            }
            a {
                text-transform: uppercase;
            }
            li:nth-child(1), li:nth-child(2) {
                border-right: solid 1px grey;
            }
            .container {
                width: 80%;
                margin-top: 3%;
                border-left: 1px solid #d9d9d9;
                border-right: 1px solid #d9d9d9;
            }
            .item {
                padding: 10px;
            }
            #welcome {
                color: grey;
                margin-left: 40%;
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
        </style>
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
                        <a class="nav-link" href="Controller?page=inventory">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?page=checkout">Check out</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?page=logout">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        
        <div class="alert alert-success">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            Welcome back, <%= userBean.getUsername() %>
        </div>
 
        <div class="container">
            
            <div class="row text-center" style="display:flex; flex-wrap:wrap;">

        <%
            try {
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
                    </div>
                </div>
                    
        <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
            </div> <!-- .row -->     
        </div> <!-- .container -->
       
    </body>
</html>
