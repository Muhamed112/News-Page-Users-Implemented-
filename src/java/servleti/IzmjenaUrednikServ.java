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
public class IzmjenaUrednikServ extends HttpServlet {

    

    

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
        urednik u = (urednik) sesija.getAttribute("urednik");
        
        String un = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String statusSel = request.getParameter("status");
        String urednik_id = request.getParameter("urednik_id");
        
        boolean status;
        
        if(statusSel.equals("true")) {
            status = true;
        } else {
            status = false;
        }
        
        //System.out.println("STATUSSS: " + statusSel);
        
        u.setUsername(un);
        u.setPassword(pass);
        u.setEmail(email);
        u.setIme(ime);
        u.setPrezime(prezime);
        //u.setStatus(status);
        
        sesija.setAttribute("urednik", u);
        
        String upit = "update dbnovosti_31_37.urednik set "
                + "username = '" + un + "',"
                + "password = '" + pass + "',"
                + "ime = '" + ime + "',"
                + "prezime = '" + prezime + "',"
                + "email = '" + email + "',"
                + "status = "+status+" "
                + "where urednik_id = "+urednik_id+"";
        
        Connection con = null;
        Statement stmt = null;
        String address = "adminKontrole.jsp";
        
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
            return;
        }
        
        request.setAttribute("poruka", "Podaci su uspjesno izmijenjeni!");
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
