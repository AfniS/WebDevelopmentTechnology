<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<head>
    <title>DVAS - Department Vehicle Application System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"></link>

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #007bff;
            font-weight: bold;
        }

        p {
            font-size: 18px;
            color: #495057;
        }

        .mb-3 {
            margin-bottom: 20px;
        }

        .btn {
            font-size: 20px;
            margin: 5px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>Welcome to Department Vehicle Application System (DVAS)!</h1>
        <p>Please select your role:</p>
        <form action="welcome.jsp" method="post">
            <div class="mb-3">
                <button type="submit" class="btn btn-primary" name="role" value="admin">Admin</button>
                <button type="submit" class="btn btn-success" name="role" value="staff">Staff</button>
                <button type="submit" class="btn btn-info" name="role" value="user_dashboard">Staff Dashboard</button>
            </div>
        </form>

        <%
        String role = request.getParameter("role");
        if (role != null) {
            if ("admin".equals(role)) {
                response.sendRedirect("log-in.jsp");
            } else if ("staff".equals(role)) {
                // Assuming staff is already logged in, redirect them to staff_veh_application.jsp
                response.sendRedirect("staff_veh_application.jsp");
            } else if ("user_dashboard".equals(role)) {
                response.sendRedirect("user_dashboard.jsp");
            }
        }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
