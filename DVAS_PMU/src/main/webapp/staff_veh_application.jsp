<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <title>Staff Vehicle Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"></link>
</head>
<body>
    <div class="container mt-5">
        <h1>Staff Vehicle Application</h1>

        <form action="process_application.jsp" method="post">
            <!-- Staff Details -->
            <div class="mb-3">
                <label for="fullName" class="form-label">Staff Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
            </div>

            <div class="mb-3">
                <label for="idNumber" class="form-label">Staff Identification Number</label>
                <input type="text" class="form-control" id="idNumber" name="idNumber" required>
            </div>

            <div class="mb-3">
                <label for="regNumber" class="form-label">Staff Registration Number</label>
                <input type="text" class="form-control" id="regNumber" name="regNumber" required>
            </div>

            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Staff Phone Number</label>
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
            </div>

            <!-- Department Vehicle Details -->
            <div class="mb-3">
                <label for="vehicle" class="form-label">Available Vehicle</label>
                <!-- Replace the options with actual vehicle options -->
                <select class="form-select" id="vehicle" name="vehicle" required>
                    <option value="car">Car</option>
                    <option value="van">Van</option>
                    <!-- Add more options as needed -->
                </select>
            </div>

            <div class="mb-3">
                <label for="passengers" class="form-label">Number of Passengers</label>
                <input type="number" class="form-control" id="passengers" name="passengers" required>
            </div>

            <div class="mb-3">
                <label for="destination" class="form-label">Destination Address</label>
                <textarea class="form-control" id="destination" name="destination" required></textarea>
            </div>

            <div class="mb-3">
                <label for="purpose" class="form-label">Purpose of Use</label>
                <input type="text" class="form-control" id="purpose" name="purpose" required>
            </div>

            <button type="submit" class="btn btn-primary">Submit Application</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
