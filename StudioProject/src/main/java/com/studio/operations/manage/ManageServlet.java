package com.studio.operations.manage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class ManageServlet
 */
@WebServlet("/manage")
public class ManageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       	Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Integer> rentIDs = new ArrayList<>();
        List<String> studioNames = new ArrayList<>();
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudioBookingSystem", "root", "malvikiller");

            // Querying RentID, StudioName to display inside each booking item under booking history
            String sqlDisplay = "select RentID, StudioName from Booking where username = ?";
            stmt = con.prepareStatement(sqlDisplay);
            
            // For the current user logged in
            String user_session_name = (String) request.getSession().getAttribute("name");
            stmt.setString(1, user_session_name);    
            rs = stmt.executeQuery();
            while (rs.next()) {
                int rentID = rs.getInt("RentID");
                String studioName = rs.getString("StudioName");
                rentIDs.add(rentID);
                studioNames.add(studioName);
            }
            
            request.setAttribute("rentIDs", rentIDs);
            request.setAttribute("studioNames", studioNames);
            
            // Forward request to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("manage.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); 
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(); 
            }
        }
    	
    }
    
}