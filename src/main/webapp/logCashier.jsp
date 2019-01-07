<%-- 
    Document   : cashier
    Created on : Jan 3, 2019, 9:57:18 PM
    Author     : BAJENARUPAVEL-ALEXAN
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>
<body>
    <div style="text-align:center"><h1>Login</h1> </div>
    <br>
    <form action="LogCashier" method="post">
        <table align="center">
            <tr>
            <td>Email</td>
            <td><input type="text" name="email" /></td>
            </tr>
            <tr>
            <td>Password</td>
            <td><input type="password" name="password" /></td>
            </tr>
            <tr>
            <td></td>
            <td><input type="submit" value="Login"></input></td>
            </tr>
        </table>
    </form>
</body>
</html>
