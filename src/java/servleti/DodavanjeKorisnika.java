/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

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
public class DodavanjeKorisnika extends HttpServlet {

    

  

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
        
        String tip = request.getParameter("tip");
        
        String un = request.getParameter("username");
        String pass = request.getParameter("password");
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String email = request.getParameter("email");
        String telefon;
        if(request.getParameter("telefon") != null) {
            telefon = request.getParameter("telefon");
        } else {
            telefon = null;
        }
        
        Connection con = null;
        Statement stmt = null;
        String address = "adminKontrole.jsp";
        String poruka = "";
        
        //Da li je prazno
         if(un.isEmpty() || pass.isEmpty()) {
            poruka = "Niste popunili sva polja!";
            request.setAttribute("poruka", poruka);
            RequestDispatcher rd = request.getRequestDispatcher("registracija.jsp");
            rd.forward(request, response);
            return;
        }
        
        //Da li se vec nalazi u bazi
        String upitTestUser = "select * from dbnovosti_31_37.user where username = '"+un+"'";
        String upitTestUrednik = "select * from dbnovosti_31_37.urednik where username = '"+un+"'";
        Statement stmtUser = null;
        Statement stmtUrednik = null;
        ResultSet rsUser = null;
        ResultSet rsUrednik = null;
        
        try {
            con = DB.getConnection();
            stmtUser = con.createStatement();
            stmtUrednik = con.createStatement();
            rsUser = stmtUser.executeQuery(upitTestUser);
            rsUrednik = stmtUrednik.executeQuery(upitTestUrednik);
            
            if(rsUser.next() || rsUrednik.next()) {
                poruka = "Korisnicko ime vec postoji!";
                request.setAttribute("poruka", poruka);
                address = "dodajKorisnika.jsp";
                
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
        
        //UREDNIK
        if(tip.equals("1")) {
            
            urednik ur = new urednik();
            ur.setUsername(un);
            ur.setPassword(pass);
            ur.setIme(ime);
            ur.setPrezime(prezime);
            ur.setEmail(email);
            ur.setStatus(true);
            
            boolean urAktivan = ur.isStatus();
            
            HttpSession sesija = request.getSession();
            sesija.setAttribute("urednik", ur);
            
            String urUpit = "insert into dbnovosti_31_37.urednik (username,password,ime,prezime,email,status)"
                + "values('" + un + "', '" + pass + "', '" + ime + "', '" + prezime + "', '" + email + "', "+urAktivan+")";
            
            try {
                con = DB.getConnection();
                stmt = con.createStatement();
                stmt.executeUpdate(urUpit);
                stmt.close();
                con.close();
            } catch(SQLException e) {
                sesija.invalidate();
                String err = e.getMessage();
                request.setAttribute("errormsg", err);
                address = "error.jsp";
            }
            
            request.setAttribute("poruka", "Dodavanje urednika uspjesno");
            RequestDispatcher rd = request.getRequestDispatcher(address);
            rd.forward(request, response);
            
            //USER
        } else if(tip.equals("0")) {
            
            user u = new user();
            u.setUsername(un);
            u.setPassword(pass);
            u.setIme(ime);
            u.setPrezime(prezime);
            u.setEmail(email);
            u.setTelefon(telefon);
            u.setStatus(true);
            
            boolean uAktivan = u.isStatus();
            
            HttpSession sesija = request.getSession();
            sesija.setAttribute("user", u);
            
            String usUpit = "insert into dbnovosti_31_37.user(username,password,ime,prezime,email,telefon,status) "
                + "values('" + un + "', '" + pass + "', '" + ime + "', '" + prezime + "', '" + email + "', '" + telefon + "', "+uAktivan+")";
            
            try {
                con = DB.getConnection();
                stmt = con.createStatement();
                stmt.executeUpdate(usUpit);
                stmt.close();
                con.close();
            } catch(SQLException e) {
                sesija.invalidate();
                String err = e.getMessage();
                request.setAttribute("errormsg", err);
                address = "error.jsp";
            }
            
            request.setAttribute("poruka", "Dodavanje usera uspjesno");
            RequestDispatcher rd = request.getRequestDispatcher(address);
            rd.forward(request, response);
            
        } else {
            System.out.println("Pogresan tip!");
        }
         
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
