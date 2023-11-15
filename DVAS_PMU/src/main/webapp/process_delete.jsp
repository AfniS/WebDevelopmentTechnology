<%@ page import="java.sql.*" %>

<%
    // Retrieve data from the form
    String applicationId = request.getParameter("applicationId");

    // Handle the delete logic
    // (you can put this logic in a separate method if needed)
    Connection dbconn = null;
    try {
        // Establish a database connection
        String dbusername = "sa";
        String dbpassword = "123456789";
        String connectionUrl = "jdbc:jtds:sqlserver://HONOR-MAGICBOOK:1433/DVAS";

        dbconn = DriverManager.getConnection(connectionUrl, dbusername, dbpassword);

        // Delete the record
        String deleteSql = "DELETE FROM vehicle_applications WHERE id = ?";
        try (PreparedStatement deleteStatement = dbconn.prepareStatement(deleteSql)) {
            deleteStatement.setInt(1, Integer.parseInt(applicationId));
            deleteStatement.executeUpdate();
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
