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
 * Servlet implementation class DeleteBookingServlet
 */
@WebServlet("/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement stmt = null;
        int rentID = Integer.parseInt(request.getParameter("rentID"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudioBookingSystem", "root", "malvikiller");

            // Delete the booking
            String sqlDelete = "delete from Booking where RentID = ?";
            stmt = con.prepareStatement(sqlDelete);
            stmt.setInt(1, rentID);
            stmt.executeUpdate();

            // Fetch the updated list of bookings
            List<Integer> rentIDs = new ArrayList<>();
            List<String> studioNames = new ArrayList<>();
            String sqlSelect = "select RentID, StudioName from Booking";
            stmt = con.prepareStatement(sqlSelect);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                rentIDs.add(rs.getInt("RentID"));
                studioNames.add(rs.getString("StudioName"));
            }

            request.setAttribute("rentIDs", rentIDs);
            request.setAttribute("studioNames", studioNames);

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