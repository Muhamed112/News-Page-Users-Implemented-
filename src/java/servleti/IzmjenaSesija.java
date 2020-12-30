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
public class IzmjenaSesija extends HttpServlet {

 

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
        String usernameZaSesiju = request.getParameter("usernameZaSesiju");
        Connection con = null;
        String address = "";
        String poruka = "-";
        
          Statement stmtUrednik = null;
          Statement stmtUser = null;
          String upitUrednik = "select * from dbnovosti_31_37.urednik where username = '"+usernameZaSesiju+"'";
          String upitUser = "select * from dbnovosti_31_37.user where username = '"+usernameZaSesiju+"'";
          ResultSet rsUrednik = null;
          ResultSet rsUser = null;
        
        try {
            
            con = DB.getConnection();
            stmtUrednik = con.createStatement();
            stmtUser = con.createStatement();
            rsUrednik = stmtUrednik.executeQuery(upitUrednik);
            rsUser = stmtUser.executeQuery(upitUser);
            
            if(rsUrednik.next()) {
                urednik u = new urednik();
                u.setUrednik_id(rsUrednik.getInt("urednik_id"));
                u.setUsername(rsUrednik.getString("username"));
                u.setPassword(rsUrednik.getString("password"));
                u.setIme(rsUrednik.getString("ime"));
                u.setPrezime(rsUrednik.getString("prezime"));
                u.setEmail(rsUrednik.getString("email"));
                u.setStatus(rsUrednik.getBoolean("status"));
                stmtUrednik.close();
                stmtUser.close();
                sesija.setAttribute("urednik", u);
                address = "izmjenaUrednik.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response);
                return;
            } else if (rsUser.next()) {
                user us = new user();
                us.setUser_id(rsUser.getInt("user_id"));
                us.setUsername(rsUser.getString("username"));
                us.setPassword(rsUser.getString("password"));
                us.setIme(rsUser.getString("ime"));
                us.setPrezime(rsUser.getString("prezime"));
                us.setEmail(rsUser.getString("email"));
                us.setTelefon(rsUser.getString("telefon"));
                us.setStatus(rsUser.getBoolean("status"));
                stmtUrednik.close();
                stmtUser.close();
                sesija.setAttribute("user", us);
                address = "izmjenaUser.jsp";
                RequestDispatcher rd = request.getRequestDispatcher(address);
                rd.forward(request, response); 
                return;
            } else {
                poruka = "Neispravno korisnicko ime i password!";
                request.setAttribute("poruka", poruka);
                address = "index.jsp";
                stmtUrednik.close();
                stmtUser.close();
            }
            
        } catch(SQLException e) {
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
