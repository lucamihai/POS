<%-- 
    Document   : errorPage
    Created on : Jan 7, 2019, 2:16:34 PM
    Author     : mihai.luca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Error</h1>
        <p>${errorMessage}</p>
        <p>
            <a href="Test">Go back to Test servlet</a>
        </p>
    </body>
</html>
