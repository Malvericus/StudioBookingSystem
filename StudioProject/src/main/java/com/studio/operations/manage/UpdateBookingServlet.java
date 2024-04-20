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
 * Servlet implementation class UpdateBookingServlet
 */
@WebServlet("/updateBooking")
public class UpdateBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement stmt = null;

        int rentID = Integer.parseInt(request.getParameter("rentID"));
        int people = Integer.parseInt(request.getParameter("people"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudioBookingSystem", "root", "malvikiller");

            // Update the booking: People, and dates
            String sqlUpdate = "update Booking set PeopleNo = ?, StartDate = ?, EndDate = ? where RentID = ?";
            stmt = con.prepareStatement(sqlUpdate);
            stmt.setInt(1, people);
            stmt.setString(2, startDate);
            stmt.setString(3, endDate);
            stmt.setInt(4, rentID);
            stmt.executeUpdate();
            
            // Fetch the updated list of bookings
            List<Integer> rentIDs = new ArrayList<>();
            List<String> studioNames = new ArrayList<>();
            String sqlSelect = "select RentID, StudioName from Booking where username = ?";
            stmt = con.prepareStatement(sqlSelect);
            
            String user_session_name = (String) request.getSession().getAttribute("name");
            
            stmt.setString(1, user_session_name);
            
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                rentIDs.add(rs.getInt("RentID"));
                studioNames.add(rs.getString("StudioName"));
            }

            request.setAttribute("rentIDs", rentIDs);
            request.setAttribute("studioNames", studioNames);
            
            request.setAttribute("successMessage", "Booking updated successfully!");

            RequestDispatcher dispatcher = request.getRequestDispatcher("manage.jsp");
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