package com.studio.operations;

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
 * Servlet implementation class BookServlet
 */
@WebServlet("/book")
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<String> studioNames = new ArrayList<>();
    	
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudioBookingSystem", "root", "malvikiller");

            String sql = "select Name from Studios";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                String studioName = rs.getString("Name");
                studioNames.add(studioName);
            }

            request.setAttribute("studioNames", studioNames);

            RequestDispatcher dispatcher = request.getRequestDispatcher("book.jsp");
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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement stmt = null;

        String studio = request.getParameter("selectStudio");
        String category = request.getParameter("category");
        int people = Integer.parseInt(request.getParameter("numPeople"));
        String fromDate = request.getParameter("fromDate");
        String endDate = request.getParameter("endDate");
        String desc = request.getParameter("description"); 
        
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudioBookingSystem", "root", "malvikiller");

            String sql = "insert into Booking (username, StudioName, Category, PeopleNo, StartDate, EndDate, Description) values (?, ?, ?, ?, ?, ?, ?)";
            stmt = con.prepareStatement(sql);
            
            String user_session_name = (String) request.getSession().getAttribute("name");
            
            stmt.setString(1, user_session_name);
            stmt.setString(2, studio);
            stmt.setString(3, category);
            stmt.setInt(4, people);
            stmt.setString(5, fromDate);
            stmt.setString(6, endDate);
            stmt.setString(7, desc);

            int rowsAffected = stmt.executeUpdate();
            dispatcher = request.getRequestDispatcher("book.jsp");

            if (rowsAffected > 0) {
            	request.setAttribute("status", "success");
            } else {
            	request.setAttribute("status", "failed");
            }
            
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace(); 
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(); 
            }
        } 
    }

}