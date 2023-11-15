<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-top: 30px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            font-size: 18px;
        }

        a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>User Dashboard</h1>

    <table>
        <tr>
            <th>Application ID</th>
            <th>Staff Name</th>
            <th>Available Vehicle</th>
            <th>Staff ID Number</th>
            <th>Passengers</th>
            <th>Registration Number</th>
            <th>Destination Address</th>
            <th>Phone Number</th>
            <th>Purpose of Use</th>
            <th>Status</th>
        </tr>
        
        <%
        // Retrieve all application data
        Connection dbconn = null;
        try {
            // Establish a database connection
            String dbusername = "sa";
            String dbpassword = "123456789";
            String connectionUrl = "jdbc:jtds:sqlserver://HONOR-MAGICBOOK:1433/DVAS"; // Update with your server and port
            Class.forName("net.sourceforge.jtds.jdbc.Driver"); // Load jTDS driver class
            dbconn = DriverManager.getConnection(connectionUrl, dbusername, dbpassword);

            // Query to retrieve all application data
            String selectSql = "SELECT * FROM vehicle_applications";
            PreparedStatement selectStatement = dbconn.prepareStatement(selectSql);

            // Execute the query
            ResultSet resultSet = selectStatement.executeQuery();

            // Display all application data in the table
            while (resultSet.next()) {
        %>
                <tr>
                    <td><%= resultSet.getInt("id") %></td>
                    <td><%= resultSet.getString("staff_full_name") %></td>
                    <td><%= resultSet.getString("available_vehicle") %></td>
                    <td><%= resultSet.getString("staff_id_number") %></td>
                    <td><%= resultSet.getInt("passengers") %></td>
                    <td><%= resultSet.getString("staff_reg_number") %></td>
                    <td><%= resultSet.getString("destination_address") %></td>
                    <td><%= resultSet.getString("staff_phone_number") %></td>
                    <td><%= resultSet.getString("purpose_of_use") %></td>
                    <td><%= resultSet.getString("status") %></td>
                </tr>
        <%
            }
        } catch (SQLException e) {
            // Handle database-related exceptions
            out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close the database connection and other resources
            try {
                if (dbconn != null) {
                    dbconn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>
    </table>

    <a href="logout.jsp">Back to Home</a>
</body>
</html>
