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
        <link rel="stylesheet" type="text/css" href="css/adminKontrole.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="center">
            <h1>Korisnici</h1>
            <h3>${poruka}</h3>
            <div class="table_div" style="max-height: 100%;overflow: auto;background-color: white;">
                <table>
                        <tr>
                            <td>Username</td>
                            <td>Password</td>
                            <td>Ime</td>
                            <td>Prezime</td>
                            <td>Uloga</td>
                            <td>Aktivan</td>                            
                            <td>Izmjena</td>
                        </tr>
                <%
                    Connection con = null;
                    String address = "";

                    Statement stmtUrednik = null;
                    Statement stmtUser = null;
                    String upitUrednik = "select * from dbnovosti_31_37.urednik";
                    String upitUser = "select * from dbnovosti_31_37.user";
                    ResultSet rsUrednik = null;
                    ResultSet rsUser = null;

                    try {
                        con = DB.getConnection();
                        stmtUrednik = con.createStatement();
                        stmtUser = con.createStatement();
                        rsUrednik = stmtUrednik.executeQuery(upitUrednik);
                        rsUser = stmtUser.executeQuery(upitUser);

                    while(rsUrednik.next()) {
                        %> 
                        <tr>
                            <td><%=rsUrednik.getString("username")%></td>
                            <td><%=rsUrednik.getString("password")%></td>
                            <td><%=rsUrednik.getString("ime")%></td>
                            <td><%=rsUrednik.getString("prezime")%></td>
                            <td>Urednik</td>
                            <%
                                boolean urednik = rsUrednik.getBoolean("status");
                                String status_urednik;
                                if(urednik) {
                                    status_urednik = "Aktivan";
                                } else {
                                   status_urednik = "Neaktivan";
                                }
                            %>
                            <td>
                                <%=status_urednik%>
                            </td>
                            <td>
                                <form method="POST" action="IzmjenaSesija">
                                    <input type="text" name="usernameZaSesiju" value="<%=rsUrednik.getString("username")%>" style="display: none;">
                                    <input type=image src="img/edit.png" alt="Submit feedback">
                                </form>
                            </td>
                        </tr>
                    <%
                }

                   while(rsUser.next()) {
                    %> 
                    <tr>
                        <td><%=rsUser.getString("username")%></td>
                        <td><%=rsUser.getString("password")%></td>
                        <td><%=rsUser.getString("ime")%></td>
                        <td><%=rsUser.getString("prezime")%></td>
                        <td>User</td>
                        <%
                            boolean user = rsUser.getBoolean("status");
                            String status_user;
                            if(user) {
                                status_user = "Aktivan";
                            } else {
                               status_user = "Neaktivan";
                            }
                        %>
                        <td>
                            <%=status_user%>
                        </td>
                        <td>
                            <form method="POST" action="IzmjenaSesija">
                                <input type="text" name="usernameZaSesiju" value="<%=rsUser.getString("username")%>" style="display: none;">
                                <input type=image src="img/edit.png" alt="Submit feedback">
                            </form>
                        </td>
                    </tr>
                    <%
                }
                
                } catch(SQLException e) {
                String err = e.getMessage();
                request.setAttribute("errormsg", err);
                address = "error.jsp";
                }
                    %>
        
           
                </table>
            </div>
            <div class="Dodavanje">       
                <div class="dodajK_link"><a href="dodajKorisnika.jsp">Dodaj Korisnika</a></div>
                <div class="nazad"><a href="index.jsp">Nazad</a></div>
            </div> 
            
        </div>
                    
    </body>
</html>
