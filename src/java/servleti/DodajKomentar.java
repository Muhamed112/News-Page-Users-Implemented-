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
public class DodajKomentar extends HttpServlet {

   

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
        
        HttpSession sesija = request.getSession();
        user Korisnik = new user();
        Korisnik = (user) sesija.getAttribute("user");
        int user_id = Korisnik.getUser_id();
        String username = Korisnik.getUsername();
        String novost_id = request.getParameter("novostID");
        String urednik_id = request.getParameter("urednikID");
        String komentar = request.getParameter("komentar");
        
        Connection con = null;
        Statement stmt = null;
        String address = "userKontrole.jsp?novosti_id="+novost_id+"&urednik_id="+urednik_id+"";
        String poruka = "";
        
        String upit = "insert into dbnovosti_31_37.komentari(novost_id,user_id,komentar,username) "
                + "values("+novost_id+","+user_id+",'"+komentar+"','"+username+"')";
        
        try {
                con = DB.getConnection();
                stmt = con.createStatement();
                stmt.executeUpdate(upit);
                stmt.close();
                con.close();
            } catch(SQLException e) {
                sesija.invalidate();
                String err = e.getMessage();
                request.setAttribute("poruka", err);
                address = "error.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response);
            }
        
            request.setAttribute("poruka", "Dodavanje komentara uspjesno!");
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
