<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Menu Items</title>
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

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            z-index: 2;
        }

        .menu-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .menu-card h2 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .menu-card p {
            font-size: 14px;
            color: #666;
            margin: 5px 0;
        }

        .menu-card p strong {
            color: #2c3e50;
        }

        .actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .actions a {
            padding: 8px 16px;
            font-size: 14px;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .actions a.edit-btn {
            background: #3498db;
        }

        .actions a.edit-btn:hover {
            background: #2980b9;
        }

        .actions a.delete-btn {
            background: #e74c3c;
        }

        .actions a.delete-btn:hover {
            background: #c0392b;
        }

        .actions a.add-to-cart-btn {
            background: #27ae60;
        }

        .actions a.add-to-cart-btn:hover {
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

    <h1>Menu for ${restaurant.restaurantName}</h1>
    <a href="/restaurants/${restaurant.restaurantId}/menu/add" class="add-btn">Add New Menu Item</a>
	<a href="/cart" class="add-btn" style="margin-left: 10px;">View Cart (${cart.items.size()})</a>

    <div class="menu-grid">
        <c:forEach var="menuItem" items="${menuItems}">
            <div class="menu-card">
                <h2>${menuItem.itemName}</h2>
                <p><strong>Description:</strong> ${menuItem.itemDescription}</p>
                <p><strong>Price:</strong> $${menuItem.price}</p>
                <p><strong>Type:</strong> ${menuItem.itemType}</p>
                <p><strong>Available:</strong> ${menuItem.availableFrom} - ${menuItem.availableUntil}</p>
                <div class="actions">
                    <a href="/restaurants/${restaurant.restaurantId}/menu/edit/${menuItem.itemId}" class="edit-btn">Edit</a>
                    <a href="/restaurants/${restaurant.restaurantId}/menu/delete/${menuItem.itemId}" class="delete-btn">Delete</a>
                    <a href="/restaurants/${restaurant.restaurantId}/menu/add-to-cart/${menuItem.itemId}" class="add-to-cart-btn">Add to Cart</a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>