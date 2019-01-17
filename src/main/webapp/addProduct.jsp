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
        <title>Add new product - POS</title>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <!-- Bootstrap --> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        
        <style>
            .errorMessage{
                color: red;
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
                <li class="nav-item active">
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
         <div class="errorMessage">${error}</div>
             <div class="main-form">
                 <form method="post">
                     <div class="row">
                       <div class="col-6">
                         <div class="form-group">
                             <label for="barcode">Barcode</label>
                             <input type="text" name="barcode" id="barcode" class="form-control" placeholder="Barcode">
                         </div>
                       </div>
                       <div class="col-6">
                         <div class="form-group">
                             <label for="barcode">Product Name</label>
                             <input type="text" name="name" id="name" class="form-control" placeholder="Product Name">
                         </div>
                       </div>
                       <div class="col-12">
                         <div class="form-group">
                             <label for="exampleFormControlTextarea1">Product Description</label>
                             <textarea class="form-control" name="description" id="description" rows="3" placeholder="Product description"></textarea>
                         </div>
                       </div>
                       <div class="col-8">
                         <div class="form-group">
                             <label for="barcode">Image Name</label>
                             <input type="text" name="imageName" id="imageName" class="form-control" placeholder="Image Name">
                         </div>  
                       </div>
                       <div class="col-4">
                         <div class="form-group">
                             <label for="barcode">Product Price</label>
                             <input type="text" name="price" id="price" class="form-control" placeholder="Price">
                         </div>
                       </div>
                     </div>
                     <input type="submit" value="Add product" class="btn btn-primary">
                 </form>
             </div>
        </div>
    </body>
</html>
