<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        html, body {
            margin: 0;
            width: 100%;
            height: 100%;
            font-family: 'Times New Roman', serif;
            font-size: 15pt;
            background-image: url('/city.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* Navbar styles */
        .navbar {
            background-color: #1230AE;
            overflow: hidden;
            display: flex;
            align-items: center;
            padding: 10px;
            justify-content: space-between;
        }

        .navbar img {
            width: 50px;
            height: auto;
            margin-right: 20px;
        }

        .navbar-links {
            display: flex;
            align-items: center;
        }

        .navbar a {
            display: inline-block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 17px;
        }

        .navbar a:hover {
            background-color: #A594F9;
        }

        /* Section visibility toggle */
        .section {
            display: none;
        }

        .active {
            display: block;
        }

        /* Main Heading */
        h3 {
            color: white;
            text-align: center;
            margin-top: 60px;
            font-size: 36px;
        }

        /* Section Heading */
        h4 {
            color: white;
            text-align: center;
            margin-top: 2cm;
            font-size: 24px;
        }

        /* Container styles */
        .form-section {
            margin: 20px auto;
            background-color: #96C9F4;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            width: 50%;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .form-section:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
        }

        table {
            width: 70%;
            border-collapse: collapse;
            margin: 20px auto;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #6A9C89;
            color: white;
        }

        input[type="text"], input[type="number"], select, textarea {
            width: 70%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #071952;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #4C3BCF;
        }

        footer {
            margin-top: 20px;
            text-align: center;
        }

        footer p {
            font-size: 12pt;
            color: #6A9C89;
        }
    </style>
    <script>
        function showSection(sectionId) {
            // Hide all sections
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => {
                section.classList.remove('active');
            });

            // Show the selected section
            const activeSection = document.getElementById(sectionId);
            activeSection.classList.add('active');
        }
    </script>
</head>
<body>

   <div class="navbar">
    <div class="navbar-links">
        <img src="/logo.jpg" alt="Smart City Logo">
        <!-- Corrected the href to point to city.jsp -->
        <a href="/city.jsp">Manage City Info</a>
       <a href="/aminity.jsp">Update Services</a>
        <a href="javascript:void(0);" onclick="showSection('monitorInfrastructure')">Monitor Infrastructure</a>
    </div>
    <a href="/index.jsp" class="logout">Logout</a>
</div>
   

    <!-- Dashboard Heading -->
    <h3>Admin Dashboard</h3>

    <!-- Sections -->
    <div id="manageCity" class="section active">
        <h4>Manage City Information</h4>
        <div class="form-section">
            <form action="manageCityInfo" method="post">
                <label for="cityName">City Name:</label><br>
                <input type="text" id="cityName" name="cityName" required><br><br>
                <label for="cityDetails">City Details:</label><br>
                <textarea id="cityDetails" name="cityDetails" rows="4" cols="50" required></textarea><br><br>
                <button type="submit">Update City Information</button>
            </form>
        </div>
    </div>

    <div id="updateServices" class="section">
        <h4>Update Public Services</h4>
        <div class="form-section">
            <form action="updateServices" method="post">
                <label for="serviceName">Service Name:</label><br>
                <input type="text" id="serviceName" name="serviceName" required><br><br>
                <label for="serviceStatus">Service Status:</label><br>
                <select id="serviceStatus" name="serviceStatus">
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select><br><br>
                <button type="submit">Update Service Status</button>
            </form>
        </div>
    </div>

    <div id="monitorInfrastructure" class="section">
        <h4>Monitor Infrastructure</h4>
        <div class="form-section">
            <form action="monitorInfrastructure" method="post">
                <label for="infrastructureId">Infrastructure ID:</label><br>
                <input type="number" id="infrastructureId" name="infrastructureId" required><br><br>
                <label for="condition">Condition:</label><br>
                <select id="condition" name="condition">
                    <option value="Good">Good</option>
                    <option value="Fair">Fair</option>
                    <option value="Poor">Poor</option>
                </select><br><br>
                <button type="submit">Update Infrastructure Condition</button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p><a href="/admin/adminhome">Back to Home</a></p>
    </footer>

</body>
</html>
