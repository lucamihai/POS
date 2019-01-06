<%-- 
    Document   : administrator
    Created on : Jan 3, 2019, 9:56:26 PM
    Author     : BAJENARUPAVEL-ALEXAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script> 
function validate()
{ 
var username = document.form.username.value; 
var password = document.form.password.value;
if (username==null || username=="")
{ 
alert("Username cannot be blank"); 
return false; 
}
else if(password==null || password=="")
{ 
alert("Password cannot be blank"); 
return false; 
} 
}
</script> 
</head>
<body>
<div style="text-align:center"><h1>Login</h1> </div>
<br>
<form name="form" action="LogAdministrator" method="post" onsubmit="return validate()">
<table align="center">
<tr>
<td>Username</td>
<td><input type="text" name="email" /></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="password" /></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Login"></input></td>
<div>${errorMessage}</div>
</tr>
</table>
</form>
</body>
</html>
