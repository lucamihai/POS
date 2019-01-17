<%-- 
    Document   : pos
    Created on : Jan 4, 2019, 4:25:44 PM
    Author     : Mihai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POS</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
         <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
        <!-- Bootstrap --> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        
        <style>
            #input{
                font-size: 200%;
            }
            button {
                background-color: darkgray;
                display: block;
                margin: 10px 0;
                padding: 10px;
                width: 100%;
                height: 100%;
                font-size: 125%;
            }
            #display{
                text-align: right;
                font-size: 125%;
                border-bottom:1px solid #eee;
                color:#ccc
            }
            
            .errorMessage{
                color: red;
            }
            body {
                background-color:#fff;
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
            .pos-container {
                background:#fff;
                width:100%;
                display:inline-block;
                padding:10px;
                position:fixed;
                margin-top:0px;
            }
            .recipe-container {
                width:70%;
                margin: 0 auto;
                border-right:1px solid #eee;
                padding-right:30px;
                height:100%;
            }
            
            .btn-round {
                border-radius:100%;
                height:60px;
                width:60px;
            }
            .row {
                margin-top:60px;
            }
            .text-center {
                text-align: center;
            }
            

            
            .btn-delete {
                margin-top: 0px;
                margin-bottom: 0px;
            }
       

        </style>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                  <a class="nav-link active" href="./POS">POS<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="./AddProduct">Add product</a>
                </li>
                 <li class="nav-item">
                  <a class="nav-link" href="./UpdateAmount">Stock managing</a>
                </li>
              </ul>
            </div>
        </nav>
        <div class="root">
            <h1 class="title">Add new product</h1>
            <div class="row">
                <div class="col-8">
                    <div class="recipe-container">
                    <table class="table">
                        <thead class="thead-dark text-center">
                          <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col"></th>
                          </tr>
                        </thead>
                            <div class="recipe-table">
                        <tbody class="text-center"}>
                            <c:forEach var="product" items="${products}" varStatus="status">
                                <tr>
                                  <th scope="row">${products.indexOf(product) + 1}</th>
                                  <td>${product.name}</td>
                                  <td>${product.price}</td>
                                  <td>1</td>
                                  <td><button class="btn btn-danger btn-sm btn-delete" onclick="SetIndexForProductToRemove(${products.indexOf(product)})" form="formRemoveProduct"><i class="fas fa-trash-alt"></i></button></td>
                                </tr>  
                            </c:forEach>
                        </tbody>
                            </div>
                      </table>
                    
            <form method="post" action="POS" id="formRemoveProduct">
                <input type="hidden" name="productIndex" id="productIndex">
                <input type="hidden" name="action" value="removeProductFromShoppingCart">
            </form>
                 </div>        
                </div>
                <div class="col-4">
                    <div class="pos-container">
                        <div class="errorMessage">${errorMessage}</div>
                        <table id="input">
                            <tr>
                                <td colspan=5 id="display">0</td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="7">7</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="8">8</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="9">9</button>
                                </td>
                                <td colspan=2>
                                    <button type="button" class="btn btn-dark btn-round" onclick="ButtonPress(this);" value="backspace">
                                        <i class="fas fa-backspace"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="4">4</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="5">5</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="6">6</button>
                                </td>
                                <td colspan=2>
                                    <button type="button" class="btn btn-dark btn-round" onclick="ButtonPress(this);" value="clear">Clear</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="1">1</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="2">2</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="3">3</button>
                                </td>
                                <td colspan=2>
                                    <form id="formBarcode" method="post" action="POS">
                                        <button  class="btn btn-dark btn-round" onclick="SetBarcode();" form="formBarcode">
                                            Enter
                                        </button>
                                        <input id="action" name="action" type="hidden" value="enter">
                                        <input id="barcode" name="barcode" type="hidden">
                                    </form>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value="0">0</button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-light btn-round" onclick="ButtonPress(this);" value=".">.</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
  
        <script>
            function ButtonPress(buton){
                var display = document.getElementById("display");
                var valoareButonApasat = buton.value;

                if (valoareButonApasat == 'backspace'){
                    
                    if (display.innerHTML.length == 1){
                        display.innerHTML = '0';
                    }
                    
                    if (display.innerHTML.length > 1){
                        display.innerHTML = display.innerHTML.slice(0, -1);
                    }

                    return;
                }

                if (valoareButonApasat == 'clear'){
                    display.innerHTML = '0';
                    return;
                }

                if (valoareButonApasat == 'enter'){
                    return;
                }

                if (valoareButonApasat == '.' && display.innerHTML == "0"){
                    display.innerHTML += '.';
                    return;
                }

                if (display.innerHTML == "0"){
                    display.innerHTML = valoareButonApasat;
                    return;
                }

                if (valoareButonApasat == '.' && display.innerHTML.includes('.')){
                    return;
                }

                display.innerHTML += valoareButonApasat;
            }
            
            function SetBarcode(){
                var display = document.getElementById("display");
                var inputBarcode = document.getElementById("barcode");
                inputBarcode.value = display.innerHTML;
            }
            
            function SetIndexForProductToRemove(index){
                var inputIndexProduct = document.getElementById("productIndex");
                inputIndexProduct.value = index;
            }
        </script>
    </body>
</html>
