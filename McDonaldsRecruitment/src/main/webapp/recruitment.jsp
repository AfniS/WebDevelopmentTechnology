<!-- This code is owned by Nurafni Hashima Binti Suhib (20DDT21F1010) -->

<!DOCTYPE html>
<html>

<head>
    <title>McDonald's Merlimau Staff Recruitment</title>
    <style>
        h1 {
            color: green;
        }
        body {
            background-color: #f0f8ff; /* Light Blue Background */
            font-family: Arial, sans-serif;
        }
        .centered-form {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: #F44D39;
            padding: 20px;
            max-width: 400px; /* Adjust the container width */
            margin: auto; /* Center the container horizontally and vertically */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo img {
            width: 150px; /* Adjust the width as needed */
        }
        .form-container h1 {
            text-align: center;
            color: #FFC72C; /* Yellow Title Color */
        }
        .form-container form {
            text-align: center;
            margin-top: 20px; /* Add spacing between form and container */
            margin-right:20px;
        }
        .form-container label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #333;
        }
        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container select, /* Add CSS for select element */
        .form-container input[type="radio"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
       
        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .form-container input[type="submit"]:hover {
            background-color: #FFC72C;
        }
        .confirmation {
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
            color: #FFC72C; /* Green Confirmation Text Color */
        }
    </style>
</head>

<body>
    <div class="centered-form">
        <div class="form-container">
            <div class="logo">
                <img src="img/mcd.png" alt="McDonald's Logo">
            </div>
            <h1>Staff Recruitment Form</h1>
            <form action="EligibilityServlet" method="post">
                <label for="name">Name:</label>
                <input type="text" name="name" required><br>
                <label for="id">Identification Number:</label>
                <input type="text" name="id" required><br>
                <label for "age">Age:</label>
                <input type="number" name="age" required><br>
                
                <!-- Dropdown for "Do you have any diseases?" -->
                <label>Do you have any diseases?</label>
                <select name="disease" required>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
                
                <input type="submit" value="Check Eligibility">
            </form>
            <p class="confirmation" id="geek"></p>
        </div>
    </div>

    <!-- JavaScript code to display a Confirm Box -->
    <script>
        function displayConfirmBox() {
            var x;
            if (confirm("Press OK to change the language to Bahasa Malaysia!") == true) {
                x = "Language successfully changed to Bahasa Malaysia!";
            } else {
                x = "No language change.";
            }
            document.getElementById("geek").innerHTML = x;
        }
    </script>
    
    <!-- Call the function when the page loads -->
    <script>
        displayConfirmBox();
    </script>
</body>

</html>
