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
public class IzmjenaUserServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

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
        user us = (user) sesija.getAttribute("user");
        
        String un = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        String telefon = request.getParameter("telefon");
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String statusSel = request.getParameter("status");
        String user_id = request.getParameter("user_id");
        
        boolean status;
        
        if(statusSel.equals("true")) {
            status = true;
        } else {
            status = false;
        }
        
        //System.out.println("STATUSSS: " + status);
        
        //System.out.println(un + " " + pass + " " + email + " " + telefon + " " + ime + " " + prezime);
        
        us.setUsername(un);
        us.setPassword(pass);
        us.setEmail(email);
        us.setTelefon(telefon);
        us.setIme(ime);
        us.setPrezime(prezime);
        us.setStatus(status);
        
        sesija.setAttribute("user", us);
        
        String upit = "update dbnovosti_31_37.user set "
                + "username = '" + un + "',"
                + "password = '" + pass + "',"
                + "ime = '" + ime + "',"
                + "prezime = '" + prezime + "',"
                + "email = '" + email + "',"
                + "telefon = '" + telefon + "',"
                + "status = "+status+" "
                + "where user_id = "+user_id+"";
        
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
