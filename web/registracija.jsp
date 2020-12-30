<%-- 
    Document   : registracija
    Created on : Dec 7, 2020, 11:30:47 PM
    Author     : Jahij
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/registracija.css">
        <title>Registracija</title>
    </head>
    <body>
       
        <div class="center">
            <h1>Registracija</h1>
            <h3>${poruka}</h3>
            <form action="Registracija" method="POST">
                <div class="txt_field">                 
                    <input type="text" name="username" required>
                    <span></span>
                    <label> Username </label>
                </div>
                
                <div class="txt_field">                   
                    <input type="text" name="password" required>
                    <span></span>
                    <label> Password </label> 
                </div>
                
                <div class="txt_field">             
                    <input type="text" name="ime" required>
                    <span></span>
                     <label> Ime </label>
                </div>
                
                <div class="txt_field">
                    <input type="text" name="prezime" required>
                    <span></span>
                    <label> Prezime </label>
                </div>
                
                <div class="txt_field">        
                    <input type="text" name="email" required>
                    <span></span>
                    <label> Email </label>
                </div>
                
                <div class="txt_field">
                    <input type="text" name="telefon" required>
                    <span></span>
                    <label> Telefon </label>
                </div>

                <input type="submit" value="Registruj se">
                <div class="nazad_link"><a href="index.jsp">Nazad</a></            </form>
        </div>
        <div>
        </div>
    </body>
</html>
