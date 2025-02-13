<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Menu Items</title>
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
        .table-container {
            margin: 50px auto;
            width: 80%;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        a {
            text-decoration: none;
            color: #ff7e5f;
            font-weight: bold;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #feb47b;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #ff7e5f;
            color: white;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .actions a {
            padding: 6px 12px;
            font-size: 14px;
            color: white;
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .actions a:hover {
            background-color: #0056b3;
        }
        .add-btn {
            display: block;
            width: 200px;
            margin: 30px auto;
            background-color: #28a745;
            color: white;
            padding: 12px;
            text-align: center;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .add-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Menu for ${restaurant.restaurantName}</h1>
    <a href="/restaurants/${restaurant.restaurantId}/menu/add" class="add-btn">Add New Menu Item</a>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Item Type</th>
                    <th>Available From</th>
                    <th>Available Until</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="menuItem" items="${menuItems}">
                    <tr>
                        <td>${menuItem.itemId}</td>
                        <td>${menuItem.itemName}</td>
                        <td>${menuItem.itemDescription}</td>
                        <td>${menuItem.price}</td>
                        <td>${menuItem.itemType}</td>
                        <td>${menuItem.availableFrom}</td>
                        <td>${menuItem.availableUntil}</td>
                        <td class="actions">
                            <a href="/restaurants/${restaurant.restaurantId}/menu/edit/${menuItem.itemId}">Edit</a>
                            <a href="/restaurants/${restaurant.restaurantId}/menu/delete/${menuItem.itemId}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
