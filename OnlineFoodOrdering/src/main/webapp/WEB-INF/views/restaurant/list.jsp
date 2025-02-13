<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Restaurant List</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            color: #333;
            text-align: center;
            padding: 20px;
            margin: 0;
        }
        h1 {
            color: #00838f;
            font-size: 36px;
            margin-bottom: 30px;
            text-transform: uppercase;
            font-weight: bold;
        }
        .table-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            width: 100%;
        }
        table {
            width: 70%;  /* Reduced table width */
            max-width: 1000px;  /* Set max width */
            border-collapse: collapse;
            background: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 8px 11px;  /* Reduced padding */
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #00838f;
            color: white;
            font-size: 14px;  /* Reduced font size for header */
        }
        tr:hover {
            background: #f5f5f5;
        }
        .btn {
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            margin: 3px;
            display: inline-block;
            transition: 0.3s;
        }
        .edit-btn {
            background: #fbc02d;
        }
        .edit-btn:hover {
            background: #f57f17;
        }
        .delete-btn {
            background: #e57373;
        }
        .delete-btn:hover {
            background: #d32f2f;
        }
        .menu-btn {
            background: #388e3c;
        }
        .menu-btn:hover {
            background: #2c6e2c;
        }
        .add-btn {
            display: inline-block;
            background: #0288d1;
            padding: 12px 18px;
            margin: 20px 0;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
            font-size: 16px;
        }
        .add-btn:hover {
            background: #0277bd;
        }
        .action-btns {
            display: flex;
            justify-content: space-evenly;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <h1>Restaurants</h1>
    <a href="/restaurants/add" class="add-btn">Add New Restaurant</a>
    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Owner</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Open Hours</th>
                <th>Close Hours</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="restaurant" items="${restaurants}">
                <tr>
                    <td>${restaurant.restaurantId}</td>
                    <td>${restaurant.restaurantName}</td>
                    <td>${restaurant.userName}</td>
                    <td>${restaurant.email}</td>
                    <td>${restaurant.contact}</td>
                    <td>${restaurant.address}</td>
                    <td>${restaurant.openHours}</td>
                    <td>${restaurant.closeHours}</td>
                    <td>
                        <div class="action-btns">
                            <a href="/restaurants/edit/${restaurant.restaurantId}" class="btn edit-btn">Edit</a>
                            <a href="/restaurants/delete/${restaurant.restaurantId}" class="btn delete-btn">Delete</a>
                            <a href="/restaurants/${restaurant.restaurantId}/menu" class="btn menu-btn">View Menu</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
