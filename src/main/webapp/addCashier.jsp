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
        <title>Register a cashier</title>
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
                width:350px;
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
       <div class="root">
            <h1 class="title">Register - Cashier</h1>
            <div class="errorMessage">${error}</div>
            <div class="main-form">
                <form method="post" onsubmit="return ValidateInputs();" action="${pageContext.request.contextPath}/AddCashier" id="signup">
                    <div class="form-group">
                        <label for="exampleInputEmail1">First Name</label>
                        <input type="text" name="firstName" class="form-control" id="firstName" placeholder="First Name">
                         <div id="errorFirstName" class="errorMessage"></div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Last Name</label>
                        <input type="text" name="firstName" class="form-control" id="lsatName" placeholder="Last Name">
                        <div id="errorLasttName" class="errorMessage"></div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="email" name="email" class="form-control" id="email" placeholder="Email">
                        <div id="errorEmail" class="errorMessage"></div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                        <div id="errorPassword" class="errorMessage"></div>
                    </div>
                    <input type="submit" value="Register" class="btn btn-primary">
                </form>
            </div>
            <a href="./LogCashier" class="nav-link">Allready have an account ?</a>
       </div>
        
         <script>
            function ValidateInputs(){
                
                var signupForm = document.getElementById("signup");
                ClearErrorDivs();

                var inputFirstName = signupForm.elements["firstName"];
                var firstName = inputFirstName.value;

                var inputLastName = signupForm.elements["lastName"];
                var lastName = inputLastName.value;

                var inputEmail = signupForm.elements["email"];
                var email = inputEmail.value;

                var inputPassword = signupForm.elements["password"];
                var password = inputPassword.value;


                var validationFirstName = ValidateFirstName(firstName);
                var validationLastName  = ValidateLastName(lastName);
                var validationEmail     = ValidateEmail(email);
                var validationPassword  = ValidatePassword(password);


                return validationFirstName && validationLastName && validationEmail && validationPassword;
            }
            
            function ClearErrorDivs(){
                var errorDivFirstName = document.getElementById("errorFirstName");
                errorDivFirstName.innerHTML = "";

                var errorDivLastName = document.getElementById("errorLastName");
                errorDivLastName.innerHTML = "";

                var errorDivEmail = document.getElementById("errorEmail");
                errorDivEmail.innerHTML = "";

                var errorDivPassword = document.getElementById("errorPassword");
                errorDivPassword.innerHTML = "";
            }

            function ValidateFirstName(firstName){
                var isOk = true;

                if (firstName == ""){
                    isOk = false;

                    var errorDivFirstName = document.getElementById("errorFirstName");
                    errorDivFirstName.innerHTML = "First name field can't be empty";
                }

                return isOk;
            }

            function ValidateLastName(lastName){
                var isOk = true;

                if (lastName == ""){
                    isOk = false;

                    var errorDivLastName = document.getElementById("errorLastName");
                    errorDivLastName.innerHTML = "Last name field can't be empty";
                }

                return isOk;
            }

            function ValidateEmail(email) {
                var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                var isOk = regex.test(String(email).toLowerCase());

                if (!isOk){
                    var errorDivEmail = document.getElementById("errorEmail");
                    errorDivEmail.innerHTML = "Invalid email";
                }

                return isOk;
            }

            function ValidatePassword(password){
                var isOk = true;

                if (password == ""){
                    isOk = false;

                    var errorDivPassword = document.getElementById("errorPassword");
                    errorDivPassword.innerHTML = "Pasword field can't be empty";
                }

                return isOk;
            }
        </script> 
    </body>
</html>
