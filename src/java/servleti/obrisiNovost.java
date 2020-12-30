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
public class obrisiNovost extends HttpServlet {

  

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
        int novosti_id = Integer.parseInt(request.getParameter("idNovosti"));
        System.out.println("Integer iz obrisi novosti: " + novosti_id);
        System.out.println("String Iz obrisi novosti: " + request.getParameter("idNovosti"));
        
        Connection con = null;
        String address = "novosti.jsp";
        String poruka = "";
        
        Statement stmt = null;
        String upit = "delete from dbnovosti_31_37.novosti where novosti_id = "+novosti_id+"";
        
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
        
        request.setAttribute("poruka", "Brisanje uspjesno");
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
