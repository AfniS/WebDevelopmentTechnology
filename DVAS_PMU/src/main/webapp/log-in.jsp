<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<head>
    <title>DVAS - Department Vehicle Application System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"></link>

    <script src="https://kit.fontawesome.com/032211c9c0.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: auto;
            margin-top: 100px;
            text-align: center;
        }

        h1 {
            font-weight: bold;
            color: #007bff;
        }

        .admin-icon {
            font-size: 2em;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
            color: #007bff;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .login-btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        .error-msg {
            color: #dc3545;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-user admin-icon"></i> Admin Login</h1>
        <form action="" method="post">
            <div class="mb-3 row">
                <label for="exampleFormControlInput1" class="form-label col-sm-12">Username</label>
                <div class="col-sm-12">
                    <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputPassword" class="form-label col-sm-12">Password</label>
                <div class="col-sm-12">
                    <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Enter your password">
                </div>
            </div>
            <div class="mb-3 row">
                <input type="submit" value="Login" class="login-btn">
            </div>
        </form>

        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null) {
            try {
                String dbusername = "sa";
                String dbpassword = "123456789";
                Connection dbconn = null;
                String sql = "SELECT * FROM login WHERE username = ? AND password = ?";
                dbconn = DriverManager.getConnection("jdbc:jtds:sqlserver://localhost/DVAS", "sa", "123456789");
                PreparedStatement SQLstatement = dbconn.prepareStatement(sql);
                SQLstatement.setString(1, username);
                SQLstatement.setString(2, password);
                ResultSet resultSet = SQLstatement.executeQuery();

                if (resultSet.next() && resultSet.getString("username").equals(username)) {
                    session.setAttribute("username", username);
                    response.sendRedirect("admin_dashboard.jsp");
                } else {
                    out.println("<p class='error-msg'>Invalid username or password. Please try again.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
