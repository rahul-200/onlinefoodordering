<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Restaurant</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: #333;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #fff;
            font-size: 36px;
            text-align: center;
            margin-top: 50px;
        }
        .form-container {
            width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.1);
        }
        label {
            font-size: 16px;
            margin-bottom: 5px;
            display: block;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="time"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #ff7e5f;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #feb47b;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
        .back-link a {
            text-decoration: none;
            color: #ff7e5f;
            font-weight: bold;
        }
        .back-link a:hover {
            color: #feb47b;
        }
    </style>
</head>
<body>
    <h1>Edit Restaurant</h1>
    <div class="form-container">
        <form action="/restaurants/edit/${restaurant.restaurantId}" method="post">
            <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}" />

            <label for="restaurantName">Name:</label>
            <input type="text" name="restaurantName" id="restaurantName" value="${restaurant.restaurantName}" required/><br>

            <label for="userName">User Name:</label>
            <input type="text" name="userName" id="userName" value="${restaurant.userName}" required/><br>

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" value="${restaurant.email}" required/><br>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" value="${restaurant.password}" required/><br>

            <label for="contact">Contact:</label>
            <input type="text" name="contact" id="contact" value="${restaurant.contact}"/><br>

            <label for="address">Address:</label>
            <input type="text" name="address" id="address" value="${restaurant.address}"/><br>

            <label for="openHours">Open Hours:</label>
            <input type="time" name="openHours" id="openHours" value="${restaurant.openHours}"/><br>

            <label for="closeHours">Close Hours:</label>
            <input type="time" name="closeHours" id="closeHours" value="${restaurant.closeHours}"/><br>

            <input type="submit" value="Update"/>
        </form>
    </div>
    <div class="back-link">
        <a href="/restaurants/${restaurant.restaurantId}">Back to Restaurant Details</a>
    </div>
</body>
</html>
