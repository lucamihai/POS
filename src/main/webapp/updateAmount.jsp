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
    </head>
    <body>
        <h1>Update Amount </h1>
        
        <div style="text-align: center">
            ${errorMessage}
        </div>
        <br>
        <form name="form" action="UpdateAmount" method="post">
            <table align="center">
                <tr>
                    <td>ID Product</td>
                    <td>
                        <input type="text" name="idProduct"/>
                    </td>
                </tr>
                <tr>
                    <td>New amount</td>
                    <td>
                        <input type="text" name="amount" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Refill"></input>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
