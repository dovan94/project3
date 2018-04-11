package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

/**
 *
 * @author VanDo
 */
public class Login extends HttpServlet {

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
        HttpSession session = request.getSession();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String location = "";
        
        String db_driver = "com.mysql.jdbc.Driver";
        String db_url = "jdbc:mysql://localhost:3306/project3";
        String db_user = "root";
//        String db_password = "";
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
            String query = "SELECT * FROM User WHERE username = \"" + username + "\" AND password = \"" + password + "\"";
            ResultSet result = stm.executeQuery(query);
            if (result.last()) {
                UserBean userBean = new UserBean();
                userBean.setUsername(username);
                userBean.setId(Integer.parseInt(result.getString("id")));
                userBean.setLoggedIn(true);
                location = "inventory.jsp";
                session.setAttribute("userBean", userBean);
                response.sendRedirect(location);
            } else {
                request.setAttribute("message", "Invalid username and/or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
