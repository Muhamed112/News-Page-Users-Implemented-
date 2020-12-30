/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

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
public class ObrisiKomentar extends HttpServlet {

   

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
        String komentar_id = request.getParameter("komentarID");
        String novosti_id = request.getParameter("novostiID");
        String urednik_id = request.getParameter("urednikID");
        
        Connection con = null;
        String address = "urednikKontrole.jsp?novosti_id="+novosti_id+"&urednik_id="+urednik_id+"";
        String poruka = "";
        
        Statement stmt = null;
        String upit = "delete from dbnovosti_31_37.komentari where komentar_id = "+komentar_id+"";
        
        try {
            con = DB.getConnection();
            stmt = con.createStatement();
            stmt.executeUpdate(upit);
            stmt.close();
            con.close();
        } catch(SQLException e) {
            String err = e.getMessage();
            request.setAttribute("poruka", err);
            address = "error.jsp";
            System.err.println(e);
        }
        
        request.setAttribute("poruka", "Brisanje komentara uspjesno");
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
