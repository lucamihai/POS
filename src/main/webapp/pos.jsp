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
        <style>
            tr,td,table{
                border: 1px solid black;
            }

            button {
                background-color: #bbb;
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
            }
        </style>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    </head>
    <body>
        <table>
            <tr>
                <td colspan=5 id="display">0</td>
            </tr>
            <tr>
                <td>
                    <button onclick="ButtonPress(this);" value="7">7</button>
                </td>
                <td>
                    <button onclick="ButtonPress(this);" value="8">8</button>
                </td>
                <td>
                    <button onclick="ButtonPress(this);" value="9">9</button>
                </td>
                <td colspan=2>
                    <button onclick="ButtonPress(this);" value="backspace">
                        <i class="fas fa-backspace"></i>
                    </button>
                </td>
            </tr>
            <tr>
                <td>
                    <button onclick="ButtonPress(this);" value="4">4</button>
                </td>
                <td>
                    <button onclick="ButtonPress(this);" value="5">5</button>
                </td>
                <td>
                    <button onclick="ButtonPress(this);" value="6">6</button>
                </td>
                <td colspan=2>
                    <button onclick="ButtonPress(this);" value="clear">Clear</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button onclick="ButtonPress(this);" value="1">1</button>
                </td>
                <td>
                    <button onclick="ButtonPress(this);" value="2">2</button>
                </td>
                <td>
                    <button onclick="ButtonPress(this);" value="3">3</button>
                </td>
                <td colspan=2>
                    <form method="post" action="POS">
                        <input onclick="SetBarcode();" type="submit" value="Enter">
                        <input id="action" name="action" type="hidden" value="enter">
                        <input id="barcode" name="barcode" type="hidden">
                    </form>
                    
                </td>
            </tr>
            <tr>
                <td colspan=2>
                    <button onclick="ButtonPress(this);" value="0">0</button>
                </td>
                <td>
                    <button onclick="ButtonPress(this);" value=".">.</button>
                </td>
            </tr>
        </table>
        <h2>Lista</h2>
        <form method="post" action="POS">
            <input type="submit">
        </form> 
        <ul>
            ${altceva}
            <c:forEach var="numar" items="${ceva}" varStatus="status">
                <li>${numar}</li>
            </c:forEach>
        </ul>
        
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
        </script>
    </body>
</html>
