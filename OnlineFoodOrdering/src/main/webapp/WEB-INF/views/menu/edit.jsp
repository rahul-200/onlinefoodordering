<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Menu Item</title>
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
        input[type="text"], input[type="number"], input[type="time"], textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        textarea {
            resize: vertical;
            height: 120px;
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
    <h1>Edit Menu Item</h1>
    <div class="form-container">
        <form action="/restaurants/${restaurant.restaurantId}/menu/edit/${menuItem.itemId}" method="post">
            <label for="itemName">Item Name:</label>
            <input type="text" name="itemName" id="itemName" value="${menuItem.itemName}" required/><br>

            <label for="itemDescription">Description:</label>
            <textarea name="itemDescription" id="itemDescription">${menuItem.itemDescription}</textarea><br>

            <label for="price">Price:</label>
            <input type="number" name="price" id="price" value="${menuItem.price}" required/><br>

            <label for="itemType">Item Type:</label>
            <input type="text" name="itemType" id="itemType" value="${menuItem.itemType}"/><br>

            <label for="availableFrom">Available From:</label>
            <input type="time" name="availableFrom" id="availableFrom" value="${menuItem.availableFrom}" required/><br>

            <label for="availableUntil">Available Until:</label>
            <input type="time" name="availableUntil" id="availableUntil" value="${menuItem.availableUntil}" required/><br>

            <input type="submit" value="Update"/>
        </form>
    </div>
    <div class="back-link">
        <a href="/restaurants/${restaurant.restaurantId}/menu">Back to Menu</a>
    </div>
</body>
</html>
