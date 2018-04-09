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
    </head>
    <body>
        <h1>Login</h1>
        <form action="Login" method="GET">
            <label for="username">Username</label>
            <input type="text" id="username" name="username"/>
                
            <label for="password">Password</label>
            <input type="password" id="password" name="password"/>
            
            <input type="submit"/>
        </form>
    </body>
</html>
