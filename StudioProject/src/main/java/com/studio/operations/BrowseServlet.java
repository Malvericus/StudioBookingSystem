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
 * Servlet implementation class BrowseServlet
 */
@WebServlet("/browse")
public class BrowseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<String> studioNames = new ArrayList<>();
        List<String> locations = new ArrayList<>();
        List<String> areas = new ArrayList<>();
        List<String> capacities = new ArrayList<>();
        List<String> availabilities = new ArrayList<>();
        List<Double> rates = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudioBookingSystem", "root", "malvikiller");

            // Query to fetch studio names
            String sql = "select * from Studios";
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            // Process query results
            while (rs.next()) {
                String studioName = rs.getString("Name");
                String location = rs.getString("Location");
                String area = rs.getString("Area");
                String capacity = rs.getString("Capacity");
                String availability = rs.getString("Available");
                double rate = rs.getDouble("RatePerDay");

                // Add data to respective lists
                studioNames.add(studioName);
                locations.add(location);
                areas.add(area);
                capacities.add(capacity);
                availabilities.add(availability);
                rates.add(rate);
            }

            // Set studio names as attribute in request
            request.setAttribute("studioNames", studioNames);
            request.setAttribute("locations", locations);
            request.setAttribute("areas", areas);
            request.setAttribute("capacities", capacities);
            request.setAttribute("availabilities", availabilities);
            request.setAttribute("rates", rates);

            // Forward request to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("browse.jsp");
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