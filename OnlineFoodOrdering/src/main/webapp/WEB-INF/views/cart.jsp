<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Your Cart</title>
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
            animation: moveBackground 10s infinite alternate;
        }

        h1 {
            font-family: 'Dancing Script', cursive;
            font-size: 72px;
            color: #2c3e50;
            margin: 50px 0 30px;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 2;
            animation: fadeIn 1s ease-out;
        }

        .cart-items {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            z-index: 2;
        }

        .cart-item {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .cart-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .cart-item h3 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .cart-item p {
            font-size: 14px;
            color: #666;
            margin: 8px 0;
        }

        .delete-btn {
            display: inline-block;
            padding: 8px 16px;
            background: #e74c3c;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s ease;
            margin-top: 10px;
        }

        .delete-btn:hover {
            background: #c0392b;
        }

        .continue-shopping {
            display: inline-block;
            margin: 30px 0;
            padding: 12px 24px;
            background: #3498db;
            color: white;
            border-radius: 12px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .continue-shopping:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }

        /* Success Alert */
        .alert {
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 12px 24px;
            background: #27ae60;
            color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            z-index: 999;
        }

        /* Floating Symbols */
        .symbol {
            position: absolute;
            font-size: 40px;
            color: rgba(255, 255, 255, 0.6);
            animation: float 6s infinite ease-in-out;
            z-index: 1;
        }

        .symbol.chef-hat { top: 10%; left: 5%; animation-duration: 8s; }
        .symbol.cutlery { top: 20%; right: 10%; animation-duration: 7s; }
        .symbol.steam { bottom: 15%; left: 15%; animation-duration: 9s; }

        /* Animations */
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes moveBackground {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Floating Symbols -->
    <div class="symbol chef-hat"><i class="fas fa-cheese"></i></div>
    <div class="symbol cutlery"><i class="fas fa-utensils"></i></div>
    <div class="symbol steam"><i class="fas fa-cloud-meatball"></i></div>

    <h1>Your Cart</h1>

    <!-- Success Alert (moved outside loop) -->
    <c:if test="${not empty success}">
        <div class="alert">${success}</div>
    </c:if>

    <div class="cart-items">
        <c:forEach var="item" items="${cart.items}">
            <div class="cart-item">
                <h3>${item.itemName}</h3>
                <p>Price: $${item.price}</p>
                <p>Type: ${item.itemType}</p>
                <a href="/cart/delete/${MenuItem.itemId}" class="delete-btn">Delete</a>
            </div>
        </c:forEach>
    </div>

    <a href="/restaurants" class="continue-shopping">Continue Shopping</a>
</body>
</html>