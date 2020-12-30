<%-- 
    Document   : izmjenaUser
    Created on : Dec 8, 2020, 3:19:55 AM
    Author     : Jahij
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="beans.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/izmjenaUser.css">
        <title>Izmjena User</title>
    </head>
    <body>
        <div class="center">
            <h1> Izmjena Korisnika</h1>
            <form action="IzmjenaUserServ" method="POST">
                <div class="txt_field">
                    <input type="text" name="username" value="${user.username}">
                    <span></span>
                    <label> Username </label>
                </div>
                
                <div class="txt_field">
                    <input type="password" name="password" value="${user.password}">
                    <span></span>
                    <label> Password </label>
                </div>
                    
                <div class="txt_field">
                    <input type="text" name="ime" value="${user.ime}">
                    <span></span>
                    <label> Ime </label>
                </div>
                
                <div class="txt_field">
                    <input type="text" name="prezime" value="${user.prezime}">
                    <span></span>
                    <label> Prezime </label>
                </div>
                
                <div class="txt_field">
                    <input type="text" name="email" value="${user.email}">
                    <span></span>
                    <label> Email </label>
                </div>    
                
                <div class="txt_field">    
                    <input type="text" name="telefon" value="${user.telefon}">
                    <span></span>
                    <label> Telefon </label>
                </div>
                
                <div class="slct_drop">
                    <select name="status">
                        <c:choose>
                            <c:when test="${user.status}">
                                <option value="true" selected>Aktivan</option>
                                <option value="false">Neaktivan</option>
                            </c:when>
                            <c:otherwise>
                                <option value="true">Aktivan</option>
                                <option value="false" selected>Neaktivan</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>
                    
                <input type="text" name="user_id" value="${user.user_id}" style="display: none;">
                <input type="submit" name="submit" value="Izmijeni">
            </form>
   
            <div class="back"><a href="adminKontrole.jsp">Nazad</a></div>
            
        </div>
    </body>
</html>
