<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aminity Management</title>
    <style>
        /* General Reset */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light Gray Background */
            color: #333;
        }

        /* Navbar Styles */
        .navbar {
            background-color: #002D62; /* Dark Blue */
            color: white;
            padding: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }

        /* Container Styles */
        .container {
            width: 70%;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff; /* White Background */
            border: 1px solid #dee2e6; /* Light Gray Border */
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .container table {
            width: 100%;
            border-spacing: 0;
        }

        .container table td {
            padding: 10px;
            vertical-align: middle;
        }

        .container table td:first-child {
            width: 30%;
            font-weight: bold;
        }

        .container table input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        /* Button Styles */
        .container button {
            background-color: #002D62; /* Dark Blue */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .container button:hover {
            background-color: #004080; /* Slightly Lighter Blue */
        }

        /* Data Table Styles */
        #aminityList table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #aminityList th, #aminityList td {
            padding: 10px;
            text-align: left;
            border: 1px solid #dee2e6;
        }

        #aminityList th {
            background-color: #002D62;
            color: white;
        }

        /* Feedback Label */
        #L1 {
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Aminity Management</h1>
    </div>

    <!-- Form Container -->
    <div class="container">
        <table>
            <tr>
                <td>Aminity ID*</td>
                <td><input type="text" id="T1" /></td>
            </tr>
            <tr>
                <td>Aminity Name*</td>
                <td><input type="text" id="T2" /></td>
            </tr>
            <tr>
                <td>Status*</td>
                <td><input type="text" id="T3" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button onclick="save()">Save</button>
                    <button onclick="read()">Read</button>
                    <button onclick="update()">Update</button>
                    <button onclick="del()">Delete</button>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><label id="L1"></label></td>
            </tr>
        </table>
    </div>

    <!-- Data Display -->
    <div id="aminityList" class="container"></div>

    <script>
        // The JavaScript code remains unchanged from your original.
        function save() {
            var T1 = document.getElementById("T1");
            var T2 = document.getElementById("T2");
            var T3 = document.getElementById("T3");

            var data = JSON.stringify({
                id: T1.value,
                aminityName: T2.value,
                status: T3.value
            });

            var url = "http://localhost:8080/aminity/save";
            callApi("POST", url, data, saveHandler);
        }

        function saveHandler(response) {
            var L1 = document.getElementById("L1");
            if (response.code == "200")
                L1.style.color = "green";
            else
                L1.style.color = "red";
            L1.innerHTML = response.msg;
        }

        function read() {
            var url = "http://localhost:8080/aminity/read";
            callApi("GET", url, "", readHandler);
        }

        function readHandler(response) {
            var data = response;
            var table = `<table border="1">
                            <tr>
                                <th>Aminity ID</th>
                                <th>Aminity Name</th>
                                <th>Status</th>
                            </tr>`;
            for (var x in data) {
                table += `<tr>
                              <td>` + data[x].id + `</td>
                              <td>` + data[x].aminityName + `</td>
                              <td>` + data[x].status + `</td>
                          </tr>`;
            }
            table += `</table>`;
            document.getElementById('aminityList').innerHTML = table;
        }

        function update() {
            var T1 = document.getElementById("T1");
            var T2 = document.getElementById("T2");
            var T3 = document.getElementById("T3");

            var data = JSON.stringify({
                id: T1.value,
                aminityName: T2.value,
                status: T3.value
            });

            var url = "http://localhost:8080/aminity/update";
            callApi("PUT", url, data, updateHandler);
        }

        function updateHandler(response) {
            var L1 = document.getElementById("L1");
            L1.style.color = "green";
            L1.innerHTML = response.msg;
        }

        function del() {
            var T1 = document.getElementById("T1");

            var url = "http://localhost:8080/aminity/delete?ID=" + T1.value;
            callApi("DELETE", url, "", deleteHandler);
        }

        function deleteHandler(response) {
            var L1 = document.getElementById("L1");
            L1.style.color = "green";
            L1.innerHTML = response.msg;
        }

        function callApi(method, url, data, handler) {
            var xhr = new XMLHttpRequest();
            xhr.open(method, url, true);
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    handler(JSON.parse(xhr.responseText));
                }
            };
            xhr.send(data);
        }
    </script>
</body>
</html>
