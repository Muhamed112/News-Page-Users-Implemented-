<%-- 
    Document   : izmijeniNovost
    Created on : Dec 11, 2020, 9:26:45 PM
    Author     : Jahij
--%>

<%@page import="util.DB"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=ISO 8859-1">
        <link rel="stylesheet" type="text/css" href="css/izmijeniNovost.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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
                        <a><li>Urednik</li></a>
                        <a href="Logout"><li>Logout</li></a>
                        <a href="novosti.jsp"><li>Nazad</li></a>         
                    </ul>
                </div>
            </div>
                <div class="novost">
        <%
            HttpSession sesija = request.getSession();
            
            Connection con = null;
            Statement stmtNovosti = null;
            ResultSet rsNovosti = null;
            String address = "novosti.jsp";
            
            String upitNovosti = "select * from dbnovosti_31_37.novosti where novosti_id = "+request.getParameter("idNovosti")+"";
            
            try {
                con = DB.getConnection();
                stmtNovosti = con.createStatement();
                rsNovosti = stmtNovosti.executeQuery(upitNovosti);
                
                while(rsNovosti.next()) {

                    %>
                       
                    <form action="IzmijeniNovost" method="POST">
                        <h3>Naslov:</h3>
                        <br>
                        <textarea id="naslov" name="naslov" rows = "2" cols = "80"><%=rsNovosti.getString("naslov")%></textarea>
                        <br>
                        <h3>Sazetak:</h3>
                        <br>
                        <textarea id="sazetak" name="sazetak" rows = "8" cols = "80"><%=rsNovosti.getString("novost_sazetak")%></textarea>
                        <br>
                        <h3>Opis:</h3>
                        <br>
                        <textarea id="opis" name="opis" rows = "20" cols = "80"><%=rsNovosti.getString("novosti_opis")%></textarea>
                        <br>
                        <input type="text" name="novostID" value="<%=rsNovosti.getString("novosti_id")%>" style="display: none;">

                        <input type="submit" value="Potvrdi">
                    </form>
                    
                    <%
                }
                
            } catch(SQLException e) {
                String err = e.getMessage();
                request.setAttribute("poruka", err);
                address = "error.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response);
            }
            
        %>
                </div>
        </div>
    </body>
</html>
