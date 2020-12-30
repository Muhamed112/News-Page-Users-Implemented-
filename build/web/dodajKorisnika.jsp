<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/dodajKorisnika.css">
        <title>Dodaj Korisnika</title>
    </head>
    <body>
        <div class="center">
            <h1>Dodaj Korisnika</h1>
            <h3>${poruka}</h3>
            <form action="DodavanjeKorisnika" method="POST">
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
                               
                <div class="txt_field" id="telefon_us">
                    <input id="telLabel" type="text" name="telefon" required>
                    <span></span>
                    <label> Telefon </label>
                </div>
                
                <div class="select-box">
                    <select name="tip" id="select_box" onchange="change(this)">
                        <option value="1">Urednik</option>
                        <option value="0" selected>User</option>
                    </select>
                </div>

                <input type="submit" value="Dodaj Korisnika">
                
            </form>

            <div class="nazadLink"><a href="adminKontrole.jsp">Nazad</a></div>          
        </div>
        
            <script>
                function change(obj) {
                    var selectBox = obj;
                    var selected = selectBox.options[selectBox.selectedIndex].value;
                    var input = document.getElementById("telefon_us");
                    if(selected === '1'){
                        document.getElementById("telLabel").required = false;
                        input.style.display = "none";
                    } else {
                        document.getElementById("telLabel").required = true;
                        input.style.display = "block"; 
                    }
                } 
            </script>
        
    </body>
</html>
