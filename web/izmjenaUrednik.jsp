<%-- 
    Document   : izmjenaUrednik
    Created on : Dec 8, 2020, 3:26:23 AM
    Author     : Jahij
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/izmjenaUrednik.css">
        <title>Izmjena Urednik</title>
    </head>
    <body>
        <div class="center">
            <h1>Izmjena Urednika</h1>
            <form action="IzmjenaUrednikServ" method="POST">
                <div class="txt_field">
                    <input type="text" name="username" value="${urednik.username}">
                    <span></span>
                    <label> Username </label>
                </div>
                    
                <div class="txt_field">
                    <input type="password" name="password" value="${urednik.password}">
                    <span></span>
                    <label> Password </label>
                </div>
                
                <div class="txt_field">
                    <input type="text" name="ime" value="${urednik.ime}">
                    <span></span>
                    <label> Ime </label>
                </div>
                
                <div class="txt_field">
                    <input type="text" name="prezime" value="${urednik.prezime}">
                    <span></span>
                    <label> Prezime </label>
                </div>
                
                <div class="txt_field">
                    <input type="text" name="email" value="${urednik.email}">
                    <span></span>
                    <label> Email </label>
                </div>
                    
                <div class="slct_field"> 
                    <select name="status">
                        <c:choose>
                            <c:when test="${urednik.status}">
                                <option value="true" selected>Aktivan</option>
                                <option value="false" >Nektivan</option>
                            </c:when>
                            <c:otherwise>
                                <option value="true" >Aktivan</option>
                                <option value="false" selected>Neaktivan</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>
            
                <input type="text" name="urednik_id" value="${urednik.urednik_id}" style="display: none;">
                <input type="submit" value="Izmjeni">
                
            </form>
            
            <div class="back-link"><a href="adminKontrole.jsp">Nazad</a></div>
                
        </div>
    </body>
</html>
