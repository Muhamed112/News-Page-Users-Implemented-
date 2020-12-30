/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

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
public class Registracija extends HttpServlet {

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
        
        user us = new user();
        String un = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        String telefon = request.getParameter("telefon");
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        
        Connection con = null;
        Statement stmt = null;
        String address = "index.jsp";
        String poruka = "";
        
        if(un.isEmpty() || pass.isEmpty()) {
            poruka = "Niste popunili sva polja!";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("registracija.jsp");
            rd.forward(request, response);
            return;
        }
        
        String upitTestUser = "select * from dbnovosti_31_37.user where username = '"+un+"'";
        String upitTestUrednik = "select * from dbnovosti_31_37.urednik where username = '"+un+"'";
        Statement stmtUser = null;
        Statement stmtUrednik = null;
        ResultSet rsUser = null;
        ResultSet rsUrednik = null;
        
        //Provjera da li se korisnicko ime nalazi u bazi
        try {
            con = DB.getConnection();
            stmtUser = con.createStatement();
            stmtUrednik = con.createStatement();
            rsUser = stmtUser.executeQuery(upitTestUser);
            rsUrednik = stmtUrednik.executeQuery(upitTestUrednik);
            
            if(rsUser.next() || rsUrednik.next()) {
                poruka = "Korisnicko ime vec postoji!";
                request.setAttribute("poruka", poruka);
                address = "registracija.jsp";
                
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response);
                return;
            }     
            
        } catch (SQLException e) {
            String err = e.getMessage();
            request.setAttribute("poruka", err);
            address = "error.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(address);
            rd.forward(request, response);
            return;
        }
        
        us.setUsername(un);
        us.setPassword(pass);
        us.setEmail(email);
        us.setTelefon(telefon);
        us.setIme(ime);
        us.setPrezime(prezime);
        us.setStatus(true);
        
        boolean Aktivan = us.isStatus();
        
        HttpSession sesija = request.getSession();
        sesija.setAttribute("user", us);
        
        String upit = "insert into dbnovosti_31_37.user (username,password,ime,prezime,email,telefon,status)"
                + "values('" + un + "', '" + pass + "', '" + ime + "', '" + prezime + "', '" + email + "', '" + telefon + "', "+Aktivan+")";

        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            stmt.executeUpdate(upit);
            stmt.close();
            con.close();
        } catch(SQLException e) {
            sesija.invalidate();
            String err = e.getMessage();
            request.setAttribute("errormsg", err);
            address = "error.jsp";
        }
        
        //address = "index.jsp";
        request.setAttribute("poruka", "Registracija uspjesna");
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
