<%-- 
    Document   : index
    Created on : Dec 7, 2020, 10:09:05 PM
    Author     : Jahij
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <title>Web Novosti</title>
    </head>
    <body>
        
        <%request.getSession().invalidate();%>
        
        
        
        <div class="center">
            <h1>Login</h1>
            <form action="Login" method="POST">
                <div class="txt_field">
                    <input type="text" name="username" required>
                    <span></span>
                    <label> Username </label>
                </div>
                 <div class="txt_field">
                    <input type="password" name="password" required>
                    <span></span>
                    <label> Password </label>
                </div>
                <div class="poruka">${(poruka != null) ? poruka : "Dobrodosli!"}</div>
                <input type="text" name="test" value="<%%>" style="display: none;">
                <input type="submit" name="submit" value="Login">
                <div class="signup_link"> Niste clan? <a href="registracija.jsp">Registracija</a></div>
                <div class="guest_link"><a href="novosti.jsp">Guest</a></div>
            
            </form>
        </div>
                
        
        
            <script>
                window.addEventListener( "pageshow", function ( event ) {
                    var historyTraversal = event.persisted || 
                         ( typeof window.performance != "undefined" && 
                              window.performance.navigation.type === 2 );
                    if ( historyTraversal ) {
                        window.location.reload();
                    }
                        });
            </script>
    </body>
</html>
