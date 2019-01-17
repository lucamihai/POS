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
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <!-- Bootstrap --> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        
        <style>
         
            table, tr, td, th{
                text-align: center;
            }
             body {
                background-color:#eee;
            }
            .root {
               width:100%;
               margin: 50px 0;
            }
            .title{
                text-align:center;
                font-family: 'Montserrat', sans-serif;
            }
            .main-form {
                background-color:#fff;
                margin: 40px auto;
                padding:20px;
                width:500px;
            }
            .title {
                color:#000;
            }
            .nav-link {
                text-align:center;
            }
        </style>
    </head>
    <body>
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">POS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <a class="nav-link" href="./POS">POS<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./AddProduct">Add product</a>
                </li>
                 <li class="nav-item active">
                  <a class="nav-link" href="./UpdateAmount">Stock managing</a>
                </li>
              </ul>
            </div>
          </nav>
         <div class="root">
            <h1 class="title">Update Amount </h1>
        
        <div style="text-align: center">
            ${errorMessage}
        </div>
        <div class="main-form">
        <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">Barcode</th>
                <th scope="col" width='100px'>Amount</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="stock" items="${stocks}" varStatus="status">
              <tr>
                <td>${stock.productBarcode}</td>
                <td>${stock.ammount}</td>
                
                <td><button class="btn btn-primary btn-sm" onclick="ProccedToUpdateStock(${stock.productBarcode})">Update</button></td>
              </tr>
              </c:forEach>
            </tbody>
        </table>
            
        <form method="post" action="UpdateAmount" id="formUpdateStock">
            <input type="hidden" name="productBarcode" id="productBarcode">
            <input type="hidden" name="ammount" id="ammount">
        </form>   
         </div>
         </div>
        
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    </body>
</html>
