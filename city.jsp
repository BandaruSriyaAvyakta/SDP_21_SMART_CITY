<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>City Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* Navbar Style */
        .navbar {
            background-color: darkblue;
            color: white;
            padding: 15px 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
        }

        /* Container Style for City Data Form */
        .container {
            width: 50%;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Form Input Fields */
        .container input[type="text"] {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .container button {
            width: 22%;
            padding: 10px;
            margin: 10px 5px;
            background-color: darkblue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .container button:hover {
            background-color: #555;
        }

        /* Buttons Section Style */
        .button-container {
            text-align: center;
        }

        /* Label for Success/Error Messages */
        #L1 {
            display: block;
            margin-top: 10px;
            text-align: center;
        }

        /* Table Style for Displaying City List */
        #clist table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
        }

        #clist table th, #clist table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        #clist table th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        Manage City Info
    </div>

    <!-- City Management Form -->
    <div class="container">
        <form id="cityForm">
            <label for="T1">City ID*</label>
            <input type="text" id="T1" />

            <label for="T2">City Name*</label>
            <input type="text" id="T2" />

            <label for="T3">State*</label>
            <input type="text" id="T3" />

            <label for="T4">Country*</label>
            <input type="text" id="T4" />

            <label for="T5">Population*</label>
            <input type="text" id="T5" />

            <!-- Action Buttons -->
            <div class="button-container">
                <button type="button" onclick="save()">Save</button>
                <button type="button" onclick="read()">Read</button>
                <button type="button" onclick="update()">Update</button>
                <button type="button" onclick="del()">Delete</button>
            </div>

            <!-- Success/Error Message -->
            <label id="L1"></label>
        </form>
    </div>

    <!-- Display City List -->
    <div id="clist"></div>

    <script src="js/main.js"></script>
    <script>
        function save() {
            var T1 = document.getElementById("T1");
            var T2 = document.getElementById("T2");
            var T3 = document.getElementById("T3");
            var T4 = document.getElementById("T4");
            var T5 = document.getElementById("T5");

            var data = JSON.stringify({
                id: T1.value,
                name: T2.value,
                state: T3.value,
                country: T4.value,
                population: T5.value
            });

            var url = "http://localhost:8080/city/save";
            callApi("POST", url, data, saveHandler);
        }

        function saveHandler(response) {
            if (response.code == "200")
                L1.style.color = "green";
            else
                L1.style.color = "red";
            L1.innerHTML = response.msg;
        }

        function read() {
            var url = "http://localhost:8080/city/read";
            callApi("GET", url, "", readHandler);
        }

        function readHandler(response) {
            var data = response;
            var table = `<table border="1">
                            <tr>
                                <th>City ID</th>
                                <th>City Name</th>
                                <th>State</th>
                                <th>Country</th>
                                <th>Population</th>
                            </tr>`;
            for (var x in data) {
                table += `<tr>
                            <td>` + data[x].id + `</td>
                            <td>` + data[x].name + `</td>
                            <td>` + data[x].state + `</td>
                            <td>` + data[x].country + `</td>
                            <td>` + data[x].population + `</td>
                          </tr>`;
            }
            table += `</table>`;
            clist.innerHTML = table;
        }

        function update() {
            var T1 = document.getElementById("T1");
            var T2 = document.getElementById("T2");
            var T3 = document.getElementById("T3");
            var T4 = document.getElementById("T4");
            var T5 = document.getElementById("T5");

            var data = JSON.stringify({
                id: T1.value,
                name: T2.value,
                state: T3.value,
                country: T4.value,
                population: T5.value
            });

            var url = "http://localhost:8080/city/update";
            callApi("PUT", url, data, saveHandler);
        }

        function del() {
            var T1 = document.getElementById("T1");
            var url = "http://localhost:8080/city/delete?ID=" + T1.value;
            callApi("DELETE", url, "", deleteHandler);
        }

        function deleteHandler(response) {
            L1.style.color = "green";
            L1.innerHTML = response.msg;
        }

        function callApi(method, url, data, handler) {
            var xhr = new XMLHttpRequest();
            xhr.open(method, url, true);
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    handler(JSON.parse(xhr.responseText));
                }
            };
            xhr.send(data);
        }
    </script>
</body>
</html>
