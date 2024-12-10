<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            height: 100vh;
            background-color: #F0E6EF;
        }
        .left-container {
            width: 50%;
            background-image: url('images/head.jpg');
            background-size: cover;
            background-position: center;
        }
        .right-container {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .loginWindow {
            width: 50%;
            max-width: 350px;
            background: #E8F9FD;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .loginHeader {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #007ACC;
            text-align: center;
        }
        .loginContent {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .loginContent label {
            font-size: 14px;
            margin-bottom: 5px;
            text-align: left;
        }
        .loginContent input {
            width: 90%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .signinButton {
            width: 100%;
            padding: 10px;
            background-color: #007ACC;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .signinButton:hover {
            background-color: #0056b3;
        }
        .ackMessage {
            text-align: center;
            font-size: 14px;
            height: 20px;
        }
    </style>
</head>
<body>
    <div class="left-container"></div>
    <div class="right-container">
        <div class="loginWindow">
            <div class="loginHeader">Admin Login</div>
            <div class="loginContent">
                <label for="T1">Username</label>
                <input type="text" id="T1" />
                
                <label for="T2">Password</label>
                <input type="password" id="T2" />
                
                <div class="ackMessage" id="ack"></div>
                <button class="signinButton" onclick="signIn()">Sign In</button>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="js/main1.js"></script>
    <script type="text/javascript">
        function signIn() {
            var data = JSON.stringify({
                username: T1.value,
                password: T2.value
            });
            var url = "http://localhost:8080/admin/login";
            callApi("POST", url, data, getResponse);
        }

        function getResponse(res) {
            if (res == "401") {
                ack.style.color = "red";
                ack.innerHTML = "Invalid Credentials!";
            } else if (res == "200") {
                ack.innerHTML = "";
                window.location.href = "/admin/adminhome"; // Redirect to admin home page on successful login
            }
        }
    </script>
</body>
</html>
