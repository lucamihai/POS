<%-- 
    Document   : addCashier
    Created on : Jan 3, 2019, 6:55:29 PM
    Author     : Mihai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add a cashier</h1>
        <form method="post" action="${pageContext.request.contextPath}/AddCashier">
            <label for="firstName">First name</label>
            <input type="text" name="firstName" id="firstName">
            <br>
            
            <label for="lsatName">Last name</label>
            <input type="text" name="lastName" id="lsatName">
            <br>
            
            <label for="email">Email</label>
            <input type="text" name="email" id="email">
            <br>
            
            <label for="password">Password</label>
            <input type="text" name="password" id="password">
            <br>
            
            <label for="text">isAdmin?</label>
            <input type="checkbox" name="admin" id="admin">
            <br>
            
            <input type="submit" value="Register">
        </form>
    </body>
</html>
