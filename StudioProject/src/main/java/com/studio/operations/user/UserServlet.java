package com.studio.operations.user;

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
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       	Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Integer> rentIDs = new ArrayList<>();
        List<String> studioNames = new ArrayList<>();
        
        List<Integer> rentDetails = new ArrayList<>();
        List<String> studioDetails = new ArrayList<>();
        List<Integer> peopleDetails = new ArrayList<>();
        List<String> startDetails = new ArrayList<>();
        List<String> endDetails = new ArrayList<>();
        List<Double> priceDetails = new ArrayList<>();
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudioBookingSystem", "root", "malvikiller");

            // Query to fetch user information
            String sql = "select username, email, phone from user_info where username = ?";
            stmt = con.prepareStatement(sql);
            
            // For the current user logged in
            String user_session_name = (String) request.getSession().getAttribute("name");
            
            stmt.setString(1, user_session_name);
                
            rs = stmt.executeQuery();

            if (rs.next()) {
            	String name = rs.getString("username");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                    
                // Set user information as attributes in the request object
                request.setAttribute("userName", name);
                request.setAttribute("userEmail", email);
                request.setAttribute("userPhone", phone);

             }

            
            // Querying RentID, StudioName to display inside each booking item under booking history
            String sqlDisplay = "select RentID, StudioName from Booking where username = ?";
            stmt = con.prepareStatement(sqlDisplay);
            stmt.setString(1, user_session_name);
            rs = stmt.executeQuery();
            
            while (rs.next()) {
                int rentID = rs.getInt("RentID");
                String studioName = rs.getString("StudioName");

                // Add data to respective lists
                rentIDs.add(rentID);
                studioNames.add(studioName);
            }
            
            request.setAttribute("rentIDs", rentIDs);
            request.setAttribute("studioNames", studioNames);
            
            
            // Displaying all booking details, including final price by joining 2 tables
            String sqlDetails = "select b.RentID, b.StudioName, b.PeopleNo, b.StartDate, b.EndDate, \n"
            		+ "p.rate * Datediff(b.EndDate, b.StartDate) as Price \n"
            		+ "from booking as b \n"
            		+ "inner join price as p on p.StudioName = b.StudioName \n"
            		+ "where username = ?";
            
            stmt = con.prepareStatement(sqlDetails);
            
            stmt.setString(1, user_session_name);
            
            rs = stmt.executeQuery();
            
            while (rs.next()) {
            	int rentDetail = rs.getInt("RentID");
                String studioDetail = rs.getString("StudioName");
                int peopleDetail = rs.getInt("PeopleNo");
                String startDetail = rs.getString("StartDate");
                String endDetail = rs.getString("EndDate");
                double priceDetail = rs.getDouble("Price");
                
                rentDetails.add(rentDetail);
                studioDetails.add(studioDetail);
                peopleDetails.add(peopleDetail);
                startDetails.add(startDetail);
                endDetails.add(endDetail);
                priceDetails.add(priceDetail);
                    
             }
            
            request.setAttribute("rentDetails", rentDetails);
            request.setAttribute("studioDetails", studioDetails);
            request.setAttribute("peopleDetails", peopleDetails);
            request.setAttribute("startDetails", startDetails);
            request.setAttribute("endDetails", endDetails);
            request.setAttribute("priceDetails", priceDetails);
            

            // Forward request to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
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