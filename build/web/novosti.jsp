<%-- 
    Document   : novosti
    Created on : Dec 11, 2020, 2:45:17 PM
    Author     : Jahij
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="util.DB"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/novosti.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&display=swap" rel="stylesheet">
        <title>Web Novosti</title>
    </head>
    <body>
    <div class="wrapper">
            
        
        <div class="header">
            <div class="inner-header">
                <div class="logo-container">
                    <h1>Web<span>Novosti</span></h1>
                </div>
                <ul class="nav">
                    <c:choose>
                        <c:when test="${urednik.urednik_id != null}">
                            <a><li>Urednik</li></a>
                            <a href="dodajNovost.jsp?urednikID=${urednik.urednik_id}"><li>Dodaj Novost</li></a>
                            <a href="Logout"><li>Logout</li></a>
                        </c:when>
                        <c:when test="${user.user_id != null}">
                                <a><li>User</li></a>
                            <a href="Logout"><li>Logout</li></a>
                        </c:when>
                        <c:otherwise>
                                <a><li>Gost</li></a>
                            <a href="index.jsp"><li>Nazad</li></a>
                        </c:otherwise>
                    </c:choose>              
                </ul>
            </div>
        </div>
        
        
                
            <div class="novosti">
                
                <div class="poruka">
                    <c:choose>
                        <c:when test="${urednik.urednik_id != null}">
                            <span>${poruka}</span>
                        </c:when>
                    </c:choose>
                </div>
        <% 
        
            Connection con = null;
            Statement stmt = null;
            String upit = "select * from dbnovosti_31_37.novosti";
            ResultSet rsNovosti = null;
            
            try {
                con = DB.getConnection();
                stmt = con.createStatement();
                rsNovosti = stmt.executeQuery(upit);

                while(rsNovosti.next()) {
                    
                    %>
                    <div class="novosti-wrapper">
                    <h2><%=rsNovosti.getString("naslov")%></h2>
                    <h4><%=rsNovosti.getString("novost_sazetak")%></h4>
                    <p><%=rsNovosti.getString("datum")%></p>
                        <c:choose>
                            <c:when test="${urednik.urednik_id != null}">
                                <a href="urednikKontrole.jsp?novosti_id=<%=rsNovosti.getString("novosti_id")%>&urednik_id=<%=rsNovosti.getString("urednik_id")%>"><span>Procitaj Vise</span></a>
                            </c:when>
                                <c:when test="${user.user_id != null}">
                                    <a href="userKontrole.jsp?novosti_id=<%=rsNovosti.getString("novosti_id")%>&urednik_id=<%=rsNovosti.getString("urednik_id")%>"><span>Procitaj Vise</span></a>
                            </c:when>
                            <c:otherwise>
                                <a href="procitajVise.jsp?novosti_id=<%=rsNovosti.getString("novosti_id")%>&urednik_id=<%=rsNovosti.getString("urednik_id")%>"><span>Procitaj Vise</span></a>
                            </c:otherwise>
                        </c:choose>
                     </div>       
                    <% 
                }
            } catch (SQLException e) {
                String err = e.getMessage();
                request.setAttribute("poruka", err);
                String address = "error.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response);
            }

        %>
            </div>  
    </div>
        
    </body>
</html>
