<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Restaurant List</title>
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
            padding: 20px;
            overflow-y: auto; /* Fix: Enable scrolling */
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

        .add-btn {
            display: inline-block;
            background: #3498db;
            color: white;
            padding: 14px 28px;
            text-decoration: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.2s ease;
            margin-bottom: 30px;
            z-index: 2;
        }

        .add-btn:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }

        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            z-index: 2;
        }

        .restaurant-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .restaurant-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .restaurant-info {
            padding: 20px;
            text-align: left;
        }

        .restaurant-info h2 {
            margin: 0;
            font-size: 24px;
            color: #2c3e50;
        }

        .restaurant-info p {
            margin: 10px 0;
            font-size: 14px;
            color: #666;
        }

        .restaurant-info p strong {
            color: #2c3e50;
        }

        .action-btns {
            display: flex;
            justify-content: space-between;
            padding: 15px;
            background: #f8f9fa;
            border-top: 1px solid #e9ecef;
        }

        .btn {
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
            color: white;
            font-size: 14px;
            transition: 0.3s;
            cursor: pointer;
        }

        .edit-btn {
            background: #3498db;
        }

        .edit-btn:hover {
            background: #2980b9;
        }

        .delete-btn {
            background: #e74c3c;
        }

        .delete-btn:hover {
            background: #c0392b;
        }

        .menu-btn {
            background: #27ae60;
        }

        .menu-btn:hover {
            background: #219653;
        }

        /* Kitchen Symbols Animation */
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
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Kitchen Symbols -->
    <div class="symbol chef-hat"><i class="fas fa-cheese"></i></div>
    <div class="symbol cutlery"><i class="fas fa-utensils"></i></div>
    <div class="symbol steam"><i class="fas fa-cloud-meatball"></i></div>

    <h1>Restaurant List</h1>
    <a href="/restaurants/add" class="add-btn">Add New Restaurant</a>

    <div class="restaurant-grid">
        <c:forEach var="restaurant" items="${restaurants}">
            <div class="restaurant-card">
                <div class="restaurant-info">
                    <h2>${restaurant.restaurantName}</h2>
                    <p><strong>Owner:</strong> ${restaurant.userName}</p>
                    <p><strong>Email:</strong> ${restaurant.email}</p>
                    <p><strong>Contact:</strong> ${restaurant.contact}</p>
                    <p><strong>Address:</strong> ${restaurant.address}</p>
                    <p><strong>Hours:</strong> ${restaurant.openHours} - ${restaurant.closeHours}</p>
                </div>
                <div class="action-btns">
                    <a href="/restaurants/edit/${restaurant.restaurantId}" class="btn edit-btn">Edit</a>
                    <a href="/restaurants/delete/${restaurant.restaurantId}" class="btn delete-btn">Delete</a>
                    <a href="/restaurants/${restaurant.restaurantId}/menu" class="btn menu-btn">View Menu</a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
