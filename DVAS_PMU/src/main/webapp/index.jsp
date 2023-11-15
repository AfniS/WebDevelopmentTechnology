<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #007bff;
            text-align: center;
            margin-top: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        form {
            margin-top: 20px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .delete-btn {
            color: red;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 20px;
        }

        .delete-btn:hover {
            color: darkred;
        }

        /* Conditional styling for status */
        .status-pending {
            color: #ffc107; /* Yellow for pending */
            font-weight: bold;
        }

        .status-approved {
            color: #28a745; /* Green for approved */
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Available Vehicle</th>
            <th>ID Number</th>
            <th>Passengers</th>
            <th>Registration Number</th>
            <th>Destination Address</th>
            <th>Phone Number</th>
            <th>Purpose of Use</th>
            <th>Status</th>
            <th>Action</th>
            <th>Delete</th>
        </tr>

        <%
        Connection dbconn = null; // Declare the Connection outside try-with-resources

        try {
            // Establish a database connection 
            String dbusername = "sa";
            String dbpassword = "123456789";
            String connectionUrl = "jdbc:jtds:sqlserver://HONOR-MAGICBOOK:1433/DVAS"; 

            dbconn = DriverManager.getConnection(connectionUrl, dbusername, dbpassword); // Assign the connection

            // Fetch the list of vehicle applications
            String sql = "SELECT * FROM vehicle_applications";
            try (PreparedStatement SQLstatement = dbconn.prepareStatement(sql);
                 ResultSet resultSet = SQLstatement.executeQuery()) {

                while (resultSet.next()) {
                    int applicationId = resultSet.getInt("id");
                    String fullName = resultSet.getString("staff_full_name");
                    String availableVehicle = resultSet.getString("available_vehicle");
                    String idNumber = resultSet.getString("staff_id_number");
                    int passengers = resultSet.getInt("passengers");
                    String regNumber = resultSet.getString("staff_reg_number");
                    String destAddress = resultSet.getString("destination_address");
                    String phoneNumber = resultSet.getString("staff_phone_number");
                    String purposeOfUse = resultSet.getString("purpose_of_use");
                    String status = resultSet.getString("status");
        %>
                    <tr>
                        <td><%= applicationId %></td>
                        <td><%= fullName %></td>
                        <td><%= availableVehicle %></td>
                        <td><%= idNumber %></td>
                        <td><%= passengers %></td>
                        <td><%= regNumber %></td>
                        <td><%= destAddress %></td>
                        <td><%= phoneNumber %></td>
                        <td><%= purposeOfUse %></td>
                        <td class="<%= status.equals("Pending") ? "status-pending" : "status-approved" %>"><%= status %></td>
                        <td>
                            <form action="process_application.jsp" method="post">
                                <input type="hidden" name="applicationId" value="<%= applicationId %>">
                                <select name="action">
                                    <option value="approve">Approve</option>
                                    <option value="decline">Decline</option>
                                </select>
                                <input type="submit" value="Submit">
                            </form>
                        </td>
                        <td>
                            <form action="process_application.jsp" method="post">
                                <input type="hidden" name="applicationId" value="<%= applicationId %>">
                                <input type="hidden" name="action" value="delete">
                                <button class="delete-btn" type="submit">&#128465;</button>
                            </form>
                        </td>
                    </tr>
        <%
                }
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
    <form action="logout.jsp" method="post">
        <input type="submit" value="Logout">
    </form>
</body>
</html>
