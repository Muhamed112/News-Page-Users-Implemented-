/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import beans.admin;
import beans.urednik;
import beans.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DB;

/**
 *
 * @author Jahij
 */
public class Login extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getSession().invalidate();
        
        HttpSession sesija = request.getSession();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String test = request.getParameter("test");
        System.out.println("value: " + test);
        
        System.out.println(username + " " + password);
        
        String poruka = "";
        if(username.isEmpty() || password.isEmpty()) {
            poruka = "Niste popunili sva polja!";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        
        Connection con = null;
        Statement stmtAdmin = null;
        Statement stmtUrednik = null;
        Statement stmtUser = null;
        String address = null;
        ResultSet rsAdmin = null;
        String upitAdmin = "select * from dbnovosti_31_37.admin where username = '"+username+"' and password = '"+password+"'";
        ResultSet rsUrednik = null;
        String upitUrednik = "select * from dbnovosti_31_37.urednik where username = '"+username+"' and password = '"+password+"'";
        ResultSet rsUser = null;
        String upitUser = "select * from dbnovosti_31_37.user where username = '"+username+"' and password = '"+password+"'";
 
        //Provjera tabele admin
        try {
            con = DB.getConnection();
            stmtAdmin = con.createStatement();
            stmtUrednik = con.createStatement();
            stmtUser = con.createStatement();
            
            rsAdmin = stmtAdmin.executeQuery(upitAdmin);
            rsUrednik = stmtUrednik.executeQuery(upitUrednik);
            rsUser = stmtUser.executeQuery(upitUser);
            
            //Setanje admina
            if(rsAdmin.next()) {
                
                admin a = new admin();
                a.setUsername(username);
                a.setPassword(password);
                a.setAdmin_id(rsAdmin.getInt("admin_id"));
                stmtAdmin.close();
                stmtUrednik.close();
                stmtUser.close();
                sesija.setAttribute("admin", a);
                address = "adminKontrole.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response);
                
            //Provjera Urednika
            } else if(rsUrednik.next()) {
                
                boolean Aktivan= rsUrednik.getBoolean("status");
                
                if(Aktivan == true) {
                    urednik u = new urednik();
                    u.setUrednik_id(rsUrednik.getInt("urednik_id"));
                    u.setUsername(username);
                    u.setPassword(password);
                    u.setIme(rsUrednik.getString("ime"));
                    u.setPrezime(rsUrednik.getString("prezime"));
                    u.setEmail(rsUrednik.getString("email"));
                    u.setStatus(true);
                    stmtAdmin.close();
                    stmtUrednik.close();
                    stmtUser.close();
                    sesija.setAttribute("urednik", u);
                    address = "novosti.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(address);
                    rd.forward(request, response);
                    return;
                } else {
                    poruka = "Korisnicki racun je deaktiviran!";
                    request.setAttribute("poruka", poruka);
                    address = "index.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(address);
                    rd.forward(request, response);
                    return;
                }

                
             //Provjera Usera   
            } else if(rsUser.next()) {
                
                boolean Aktivan= rsUser.getBoolean("status");
                
                if(Aktivan == true) {
                    user us = new user();
                    us.setUser_id(rsUser.getInt("user_id"));
                    us.setUsername(username);
                    us.setPassword(password);
                    us.setIme(rsUser.getString("ime"));
                    us.setPrezime(rsUser.getString("prezime"));
                    us.setEmail(rsUser.getString("email"));
                    us.setTelefon(rsUser.getString("telefon"));
                    stmtAdmin.close();
                    stmtUrednik.close();
                    stmtUser.close();
                    sesija.setAttribute("user", us);
                    address = "novosti.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(address);
                    rd.forward(request, response);
                    return;
                } else {
                    poruka = "Korisnicki racun je deaktiviran!";
                    request.setAttribute("poruka", poruka);
                    address = "index.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(address);
                    rd.forward(request, response);
                    return;
                }
                    
            } else {
                poruka = "Neispravno korisnicko ime i password!";
                request.setAttribute("poruka", poruka);
                address = "index.jsp";
                stmtAdmin.close();
                stmtUrednik.close();
                stmtUser.close();
            }
                        
        } catch(SQLException e) {
            sesija.invalidate();
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
            address = "error.jsp";
            System.err.println(e);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(address);
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
