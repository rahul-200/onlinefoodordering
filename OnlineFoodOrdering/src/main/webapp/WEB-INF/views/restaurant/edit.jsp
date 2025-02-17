<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Restaurant</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            overflow-y: auto;
            position: relative;
        }

        h1 {
            font-family: 'Dancing Script', cursive;
            font-size: 72px;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 2;
            animation: fadeIn 1s ease-out;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            transform: translateY(50px);
            transition: transform 0.5s ease, box-shadow 0.5s ease;
            backdrop-filter: blur(10px);
            z-index: 2;
        }

        .form-container:hover {
            transform: translateY(0);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        label {
            font-size: 14px;
            font-weight: 500;
            color: #2c3e50;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="time"] {
            padding: 12px;
            border: 2px solid #3498db;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s, box-shadow 0.3s;
            background: rgba(255, 255, 255, 0.8);
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="time"]:focus {
            border-color: #2980b9;
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.5);
            outline: none;
        }

        input[type="submit"] {
            padding: 12px;
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: transform 0.2s ease, background 0.3s ease;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #2980b9, #3498db);
            transform: translateY(-2px);
        }

        input[type="submit"]:active {
            transform: translateY(0);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }

        .back-link a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .back-link a:hover {
            color: #2980b9;
        }

        /* Floating Kitchen Symbols */
        .symbol {
            position: absolute;
            font-size: 40px;
            color: rgba(255, 255, 255, 0.6);
            animation: float 6s infinite ease-in-out;
            z-index: 1;
        }

        .symbol.chef-hat {
            top: 10%;
            left: 5%;
            animation-duration: 8s;
        }

        .symbol.cutlery {
            top: 20%;
            right: 10%;
            animation-duration: 7s;
        }

        .symbol.steam {
            bottom: 15%;
            left: 15%;
            animation-duration: 9s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
        }

        /* Animation for the heading */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Background Animation */
        @keyframes moveBackground {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        body {
            animation: moveBackground 10s infinite alternate;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Floating Kitchen Symbols -->
    <div class="symbol chef-hat"><i class="fas fa-cheese"></i></div>
    <div class="symbol cutlery"><i class="fas fa-utensils"></i></div>
    <div class="symbol steam"><i class="fas fa-cloud-meatball"></i></div>

    <h1>Edit Restaurant</h1>

    <div class="form-container">
        <form action="/restaurants/edit/${restaurant.restaurantId}" method="post">
            <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}" />

            <div class="form-group">
                <label for="restaurantName">Name:</label>
                <input type="text" name="restaurantName" id="restaurantName" value="${restaurant.restaurantName}" required/>
            </div>
            <div class="form-group">
                <label for="userName">User Name:</label>
                <input type="text" name="userName" id="userName" value="${restaurant.userName}" required/>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" value="${restaurant.email}" required/>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" value="${restaurant.password}" required/>
            </div>
            <div class="form-group">
                <label for="contact">Contact:</label>
                <input type="text" name="contact" id="contact" value="${restaurant.contact}"/>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" name="address" id="address" value="${restaurant.address}"/>
            </div>
            <div class="form-group">
                <label for="openHours">Open Hours:</label>
                <input type="time" name="openHours" id="openHours" value="${restaurant.openHours}"/>
            </div>
            <div class="form-group">
                <label for="closeHours">Close Hours:</label>
                <input type="time" name="closeHours" id="closeHours" value="${restaurant.closeHours}"/>
            </div>
            <input type="submit" value="Update"/>
        </form>
    </div>
    <div class="back-link">
        <a href="/restaurants/${restaurant.restaurantId}">Back to Restaurant Details</a>
    </div>
</body>
</html>