<%-- 
    Document   : addStock
    Created on : Jan 4, 2019, 4:27:03 PM
    Author     : BAJENARUPAVEL-ALEXAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add a stock</h1>
        <div class="errorMessage">${error}</div>
        <form method="post">
            <label for="idProduct">IdProduct</label>
            <br>
            <input type="number" name="idProduct" id="idProduct">
            <br>
            
            <label for="amount">Amount</label>
            <br>
            <input type="number" name="amount" id="amount">
            <br>
    
            <input type="submit" value="Register">
        </form>
            
        <a href="Test">Go back</a>
    </body>
</html>
