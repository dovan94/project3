<%-- 
    Document   : checkout
    Created on : Apr 10, 2018, 11:17:27 PM
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
            .container {
                /*margin-top: 3%;*/
            }
            medium {
                margin-left: 5%;
            }
            table, tr, th, td {
                border-color: #e6e6e6;
                border-left: none;
                border-right: none;
            }
            #subtotal {
                font-family: "Comic Sans MS", cursive, sans-serif;
                font-size: 20pt;
            }
            button {
                margin: 3% 40%;
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
        <h1 style="margin-left:7%; margin-top:2%;">Checkout!</h1>
        <div class="container">
            <table border="1" cellpadding="8" width="90%" style="margin-top:3%; margin-left:auto; margin-right:auto;">
                <tr>
                    <th style="padding-left:25%;">Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            <% try { 
                Integer userId = userBean.getId();
            
                conn = DriverManager.getConnection(db_url + db_name, db_user, db_password);
                stm = conn.createStatement();
                String query = "SELECT DVD.name, DVD.price, DVD.image, Cart.quantity FROM DVD JOIN Cart "
                             + "ON DVD.id = Cart.product_id WHERE Cart.user_id = " + userId; 
                results = stm.executeQuery(query);
                int subtotal = 0;
                while(results.next()) {  
                    subtotal += Integer.parseInt(results.getString("price"));
            %>
                    <tr>
                        <td>
                            <img src="<%= results.getString("image") %>" style="height:70%;"/>
                            <medium><%= results.getString("name") %></medium>
                        </td>
                        <td><%= results.getString("quantity") %></td>
                        <td>$<%= results.getString("price") %></td>
                        
                    </tr>
            
            <%  } //while %>
                <tr id="subtotal">
                    <td></td>
                    <td>Subtotal:</td>
                    <td>$<% out.print(subtotal); %></td>
                </tr>
            <% 
                } catch (Exception e) {
                e.printStackTrace();
             } %>
            </table>
            <form action="ProcessOrder" method="POST">
                <button type="submit" class="btn btn-primary btn-lg" name="id" value="<%=userBean.getId()%>">Submit Order</button>
            </form>
            
        </div>
        
    </body>
</html>

