<%-- 
    Document   : addProduct
    Created on : Jan 4, 2019, 2:53:25 PM
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
        <h1>Add a product</h1>
        <div class="errorMessage">${error}</div>
        <form method="post">
            <label for="barcode">Barcode</label>
            <br>
            <input type="text" name="barcode" id="barcode">
            <br>
            
            <label for="name">Name</label>
            <br>
            <input type="text" name="name" id="name">
            <br>
            
            <label for="description">Description</label>
            <br>
            <input type="text" name="description" id="description">
            <br>
            
            <label for="imageName">Image_Name</label>
            <br>
            <input type="text" name="imageName" id="imageName">
            <br>
            
            <label for="price">Price</label>
            <br>
            <input type="text" name="price" id="price">
            <br>
            
            <input type="submit" value="Register">
        </form>
            
        <a href="Test">Go back</a>
    </body>
</html>
