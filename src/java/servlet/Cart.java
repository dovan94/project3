/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author VanDo
 */
public class Cart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        UserBean userBean = (UserBean)request.getSession(false).getAttribute("userBean");
        Integer movieId = Integer.parseInt(request.getParameter("movie"));
        Integer userId = userBean.getId();
        
        String location = "";
        
        String db_driver = "com.mysql.jdbc.Driver";
        String db_url = "jdbc:mysql://localhost:3306/project3";
        String db_user = "root";
        String db_password = "Venusdo94!";
        try {
            Class.forName(db_driver);
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        }  
        
        try {
            // Connect to database
            Connection conn = DriverManager.getConnection(db_url, db_user, db_password);
            Statement stm = conn.createStatement();
            String query = "SELECT * FROM Cart where product_id = " + movieId + " AND user_id = " + userId;
            ResultSet result = stm.executeQuery(query);
            if(!result.last()) {
                String query2 = "INSERT INTO Cart(product_id, user_id, quantity) values (?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query2);
                ps.setInt(1, movieId);
                ps.setInt(2, userId);
                ps.setInt(3, 1);
                ps.execute();

                request.setAttribute("message", "success");
                request.getRequestDispatcher("inventory.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "fail");
                request.getRequestDispatcher("inventory.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
