/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import beans.novosti;
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
public class DodajNovost extends HttpServlet {

   

   

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
        String naslov = request.getParameter("naslov");
        String sazetak = request.getParameter("novost_sazetak");
        String opis = request.getParameter("novosti_opis");
        String urednik_id = request.getParameter("urednikID");
        
        //System.out.println(urednik_id);
        
        Connection con = null;
        Statement stmt = null;
        String address = "dodajNovost.jsp";
        String poruka = "";
        
        /*novosti nov = new novosti();
        nov.setNaslov(naslov);
        nov.setNovost_sazetak(sazetak);
        nov.setNovosti_opis(opis);

        sesija.setAttribute("novosti", nov);*/
        
        String upit =  "insert into dbnovosti_31_37.novosti(naslov,novost_sazetak,novosti_opis,datum,urednik_id) "
                       + "values('" + naslov + "', '" + sazetak + "', '" + opis +"',DATE(CURRENT_TIMESTAMP),"+urednik_id+")";
        
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
        
            request.setAttribute("poruka", "Dodavanje novosti uspjesno!");
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
