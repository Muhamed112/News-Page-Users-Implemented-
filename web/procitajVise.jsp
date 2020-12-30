<%-- 
    Document   : procitajVise
    Created on : Dec 11, 2020, 3:38:17 PM
    Author     : Jahij
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="util.DB"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Novosti</title>
        <link rel="stylesheet" type="text/css" href="css/procitajVise.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;800&display=swap" rel="stylesheet">
    </head>
    <body>
        
        <div class="header">
            <div class="inner-header">
                <div class="logo-container">
                    <h1>Web<span>Novosti</span></h1>
                </div>
                <ul class="nav">
                    <a href="novosti.jsp"><li>Nazad</li></a>            
                </ul>
            </div>
        </div>
        <div class="novost">
        <%
            String novosti_id = request.getParameter("novosti_id");
            String urednik_id = request.getParameter("urednik_id");
            
            Connection con = null;
            Statement stmtNovosti = null;
            Statement stmtUrednik = null;
            ResultSet rsNovosti = null;
            ResultSet rsUrednik = null;
            String address = "";
            String upitNovosti = "select * from dbnovosti_31_37.novosti where novosti_id = "+novosti_id+"";
            String upitUrednik = "select * from dbnovosti_31_37.urednik where urednik_id = "+urednik_id+"";
            
            try {
                con = DB.getConnection();
                stmtNovosti = con.createStatement();
                stmtUrednik = con.createStatement();
                rsUrednik = stmtUrednik.executeQuery(upitUrednik);
                rsNovosti = stmtNovosti.executeQuery(upitNovosti);
                
                while(rsNovosti.next()) {
                    %>
                    <h1><%=rsNovosti.getString("naslov")%></h1>
                    <p><%=rsNovosti.getString("novosti_opis")%></p>
                    
                    <%
                        while(rsUrednik.next()) {
                            %>
                            <p><b>Urednik:</b> <%=rsUrednik.getString("ime")%> <%=rsUrednik.getString("prezime")%></p>
                            <%
                        }
                    %>
                    
                    <span>Datum: <%=rsNovosti.getString("datum")%></span>
                    <h3>Komentari:</h3>
                    <div class="komentari">
                    <%
                        //ISPIS SVIH KOMENTARA
                        
                        Statement stmtKomentari = null;
                        Statement stmtUseri = null;
                        ResultSet rsKomentari = null;
                        ResultSet rsUseri = null;
                        String upitKomentari = "select * from dbnovosti_31_37.komentari where novost_id = "+rsNovosti.getString("novosti_id")+"";
                        String upitUseri = "select * from dbnovosti_31_37.user";
                        
                        try {
                            stmtKomentari = con.createStatement();
                            stmtUseri = con.createStatement();
                            rsKomentari = stmtKomentari.executeQuery(upitKomentari);
                            rsUseri = stmtUseri.executeQuery(upitUseri);
                            
                            while(rsKomentari.next()) { 
                                %>
                                    <span><%=rsKomentari.getString("username")%></span>
                                    <p><%=rsKomentari.getString("komentar")%></p>
                                <%
                            }
                            
                        } catch(SQLException e) {
                            String err = e.getMessage();
                            request.setAttribute("poruka", err);
                            address = "error.jsp";
                            RequestDispatcher rd = request.getRequestDispatcher(address);
                            rd.forward(request, response);
                        }
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
