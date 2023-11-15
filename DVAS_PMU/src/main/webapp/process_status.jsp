<%@ page import="java.sql.*" %>

<%
    // Retrieve data from the form
    String applicationId = request.getParameter("applicationId");
    String action = request.getParameter("action");

    // Handle the status update logic
    // (you can put this logic in a separate method if needed)
    Connection dbconn = null;
    try {
        // Establish a database connection
        String dbusername = "sa";
        String dbpassword = "123456789";
        String connectionUrl = "jdbc:jtds:sqlserver://HONOR-MAGICBOOK:1433/DVAS";

        dbconn = DriverManager.getConnection(connectionUrl, dbusername, dbpassword);

        // Update the status based on the action
        String updateStatusSql = "UPDATE vehicle_applications SET status = ? WHERE id = ?";
        try (PreparedStatement updateStatusStatement = dbconn.prepareStatement(updateStatusSql)) {
            updateStatusStatement.setString(1, action);
            updateStatusStatement.setInt(2, Integer.parseInt(applicationId));
            updateStatusStatement.executeUpdate();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close the database connection
        try {
            if (dbconn != null) {
                dbconn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Redirect back to the admin dashboard
    response.sendRedirect("admin_dashboard.jsp");
%>
