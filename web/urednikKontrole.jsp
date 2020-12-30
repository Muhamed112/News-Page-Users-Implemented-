<%-- 
    Document   : urednikKontrole
    Created on : Dec 7, 2020, 10:59:47 PM
    Author     : Jahij
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="util.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/urednikKontrole.css">
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
                            <p><b>Urednik: </b><%=rsUrednik.getString("ime")%> <%=rsUrednik.getString("prezime")%></p>
                            <%
                        }
                    %>
                    
                    <span><%=rsNovosti.getString("datum")%></span>
                        <div class="forma-urednik">
                    <form method="POST" action="obrisiNovost">
                        <input type="text" name="idNovosti" value="<%=novosti_id%>" style="display: none;">
                        <input type="submit" name="submit" value="Obrisi Novost">
                        <button type="submit" formaction="izmijeniNovost.jsp">Izmijeni Novost</button>
                    </form>
                        </div>
                    <h3>Komentari:</h3>
                    <p style="text-align: center; margin-top: 20px; font-weight: bold;">${poruka}</p>
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
                                <div class="user-kom">   
                                    <span><%=rsKomentari.getString("username")%></span>
                                    <p><%=rsKomentari.getString("komentar")%></p>
                                </div> 
                                <div class="dugme-obrisi">
                                    <form action="ObrisiKomentar" method="POST">
                                        <input type="text" name="komentarID" value="<%=rsKomentari.getString("komentar_id")%>" style="display: none;">
                                        <input type="text" name="novostiID" value="<%=novosti_id%>" style="display: none;">
                                        <input type="text" name="urednikID" value="<%=urednik_id%>" style="display: none;">
                                        <input type="submit" value="Obriši">
                                    </form>
                                </div>
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
