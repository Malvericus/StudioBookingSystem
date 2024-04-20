package com.studio.operations.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String user_session_name = (String) request.getSession().getAttribute("name");
        int rentID = Integer.parseInt(request.getParameter("rentID"));

        // Set the content type for the response
        response.setContentType("text/html");

        // Get the writer to write the response
        java.io.PrintWriter out = response.getWriter();

        // Check if the user's payment is already processed
        boolean paymentProcessed = isPaymentProcessed(user_session_name);

        if (paymentProcessed) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Payment Success</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<script>");
            out.println("alert('Payment Successful!');");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
        } else {
            // Process the payment and update the database
            processPayment(user_session_name, request, rentID); // Pass the request object
            request.setAttribute("paid", true);

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Payment Success</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<script>");
            out.println("alert('Payment Successful!');");
            out.println("</script>");
            out.println("</body>");
            out.println("</html>");
        }

        // Flush and close the writer
        out.flush();
        out.close();
    }

    private boolean isPaymentProcessed(String user_session_name) {
        return false; // Assuming payment is not processed yet
    }

    private void processPayment(String user_session_name, HttpServletRequest request, int rentID) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/StudioBookingSystem", "root", "malvikiller");
            String sql = "insert into UserPayment (username, paid) values (?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, user_session_name);
            stmt.setBoolean(2, true); 

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Instead of request.getSession().setAttribute("paid", true);
                Map<Integer, Boolean> paymentStatus = (Map<Integer, Boolean>) request.getSession().getAttribute("paymentStatus");
                if (paymentStatus == null) {
                    paymentStatus = new HashMap<>();
                }
                paymentStatus.put(rentID, true);
                request.getSession().setAttribute("paymentStatus", paymentStatus);
            }

            stmt.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
