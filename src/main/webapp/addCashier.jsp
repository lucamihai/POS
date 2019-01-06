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
        
        <style>
            .errorMessage{
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Add a cashier</h1>
        <div class="errorMessage">${error}</div>
        <form method="post" onsubmit="return ValidateInputs();" action="${pageContext.request.contextPath}/AddCashier" id="signup">
            <label for="firstName">First name</label>
            <br>
            <input type="text" name="firstName" id="firstName">
            <div id="errorFirstName" class="errorMessage"></div>
            <br>
            
            <label for="lsatName">Last name</label>
            <br>
            <input type="text" name="lastName" id="lsatName">
            <div id="errorLastName" class="errorMessage"></div>
            <br>
            
            <label for="email">Email</label>
            <br>
            <input type="text" name="email" id="email">
            <div id="errorEmail" class="errorMessage"></div>
            <br>
            
            <label for="password">Password</label>
            <br>
            <input type="password" name="password" id="password">
            <div id="errorPassword" class="errorMessage"></div>
            <br>
            
            <label for="text">isAdmin?</label>
            <input type="checkbox" name="admin" id="admin">
            <br>
            
            <input type="submit" value="Register">
        </form>
            
        <a href="Test">Go back</a>
    </body>
    
    
    
    
</html>
