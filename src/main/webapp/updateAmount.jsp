<%-- 
    Document   : updateAmount
    Created on : Jan 6, 2019, 3:15:41 PM
    Author     : BAJENARUPAVEL-ALEXAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <style>
            *{
                background-color: rgb(0, 0, 0);
                color: rgb(65, 120, 175);
            }
            table, tr, td, th{
                border: 1px solid lightgray;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Update Amount </h1>
        
        <div style="text-align: center">
            ${errorMessage}
        </div>
        <br>
        <table align="center">
            <tr>
                <th>Product barcode</th>
                <th>Available in stock</th>
                <th></th>
            </tr>
            <c:forEach var="stock" items="${stocks}" varStatus="status">
                <tr>
                    <td>${stock.productBarcode}</td>
                    <td>
                        ${stock.ammount}
                    </td>
                    <td>
                        <button onclick="ProccedToUpdateStock(${stock.productBarcode})">Update stock</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <form method="post" action="UpdateAmount" id="formUpdateStock">
            <input type="hidden" name="productBarcode" id="productBarcode">
            <input type="hidden" name="ammount" id="ammount">
        </form>
        
        <script>
            function ProccedToUpdateStock(barcode){
                
                var inputProductBarcode = document.getElementById("productBarcode");
                var inputAmmount = document.getElementById("ammount");
                
                var ammount = prompt("Enter ammount for product with barcode " + barcode);
                if (ammount != null && ammount != ""){
                    
                    var isNumber = !isNaN(ammount);
                    if (!isNumber){
                        alert("Enter a valid number");
                        return;
                    }
                    
                    var isAtLeastZero = (ammount >= 0);
                    if (!isAtLeastZero){
                        alert("Ammount must be at least 0");
                        return;
                    }
                        
                    inputProductBarcode.value = barcode;
                    inputAmmount.value = ammount;

                    var formUpdateStock = document.getElementById("formUpdateStock");
                    formUpdateStock.submit();
                }
            }
        </script>
    </body>
</html>
