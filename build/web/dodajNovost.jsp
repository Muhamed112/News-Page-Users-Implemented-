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
        <link rel="stylesheet" type="text/css" href="css/dodajNovost.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
        <title>Web Novosti</title>
    </head>
    <body>
        <%
            String urednik_id = request.getParameter("urednikID");
        %>
        <div class="center">
            <h1>Dodaj Novost</h1>
            <h3>${poruka}</h3>
            <form action="DodajNovost" method="POST">
                <div class="txt_field">
                    <label> Naslov </label>
                    <textarea type="text" name="naslov" rows="2" cols = "40"></textarea>
                </div>

                <div class="txt_field">
                    <label> Sazetak </label>
                    <textarea type="text" name="novost_sazetak" rows = "6" cols = "40"></textarea>
                </div>

                <div class="txt_field">
                    <label> Opis </label>
                    <textarea type="text" name="novosti_opis"rows = "7" cols = "40"></textarea>
                </div>

                <input type="text" name="urednikID" value="<%=urednik_id%>" style="display: none;">
                <input type="submit" value="Dodaj Novost">
                <button type="submit" formaction="novosti.jsp">Nazad</button>
                </form>
         </div>
    </body>
</html>