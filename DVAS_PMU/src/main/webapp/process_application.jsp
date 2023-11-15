<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Process Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #007bff;
        }

        .confirmation-message {
            margin-top: 20px;
            text-align: center;
            color: #28a745;
        }

        .back-to-home {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<%
    Connection dbconn = null;
    try {
        // Retrieve form data
        String fullName = request.getParameter("fullName");
        String idNumber = request.getParameter("idNumber");
        String regNumber = request.getParameter("regNumber");
        String phoneNumber = request.getParameter("phoneNumber");
        String vehicle = request.getParameter("vehicle");
        int passengers = Integer.parseInt(request.getParameter("passengers"));
        String destination = request.getParameter("destination");
        String purpose = request.getParameter("purpose");

        // Database connection details
        String dbusername = "sa";
        String dbpassword = "123456789";
        String connectionUrl = "jdbc:jtds:sqlserver://HONOR-MAGICBOOK:1433/DVAS";

        try {
            // Establish a database connection
            Class.forName("net.sourceforge.jtds.jdbc.Driver");
            dbconn = DriverManager.getConnection(connectionUrl, dbusername, dbpassword);

            // Handle the delete action
            String action = request.getParameter("action");
            if (action != null && action.equals("delete")) {
                String applicationId = request.getParameter("applicationId");
                String deleteSql = "DELETE FROM vehicle_applications WHERE id = ?";
                try (PreparedStatement deleteStatement = dbconn.prepareStatement(deleteSql)) {
                    deleteStatement.setInt(1, Integer.parseInt(applicationId));
                    int rowsAffected = deleteStatement.executeUpdate();
                    out.println("<p>Application deleted successfully. Rows affected: " + rowsAffected + "</p>");
                }
            } else {
                // Insert the application data into the database
                String insertSql = "INSERT INTO vehicle_applications (staff_full_name, staff_id_number, staff_reg_number, staff_phone_number, available_vehicle, passengers, destination_address, purpose_of_use, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'Pending')";
                try (PreparedStatement insertStatement = dbconn.prepareStatement(insertSql)) {
                    insertStatement.setString(1, fullName);
                    insertStatement.setString(2, idNumber);
                    insertStatement.setString(3, regNumber);
                    insertStatement.setString(4, phoneNumber);
                    insertStatement.setString(5, vehicle);
                    insertStatement.setInt(6, passengers);
                    insertStatement.setString(7, destination);
                    insertStatement.setString(8, purpose);

                    int rowsAffected = insertStatement.executeUpdate();

                    // Display confirmation message
%>
                    <div class="container">
                        <h1>Application Submitted Successfully!</h1>
                        <p class="confirmation-message">Please check your staff dashboard to see the status of your application.</p>
                        <div class="back-to-home">
                            <a href="welcome.jsp">Back to Home</a>
                        </div>
                    </div>
<%
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            // Handle exceptions
            out.println("An error occurred: " + e.getMessage());
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
    } catch (Exception e) {
        // Handle any other exceptions
        e.printStackTrace();
    }
%>

</body>
</html>
