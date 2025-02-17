<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to Korporate Kitchen</title>
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
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            overflow: hidden;
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
        }

        p {
            font-size: 20px;
            color: #555;
            margin-bottom: 30px;
            line-height: 1.6;
            z-index: 2;
        }

        .search-container {
            margin-bottom: 30px;
            z-index: 2;
        }

        .search-container form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        input[type="text"] {
            padding: 14px;
            width: 300px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.3);
        }

        button {
            padding: 14px 24px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }

        button:active {
            transform: translateY(0);
        }

        .btn-container {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
            z-index: 2;
        }

        .btn {
            display: inline-block;
            background: #3498db;
            color: white;
            padding: 14px 28px;
            text-decoration: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 500;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }

        .btn:active {
            transform: translateY(0);
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

        h1 {
            animation: fadeIn 1s ease-out;
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

    <h1>Welcome to Korporate Kitchen</h1>
    <p>Your gateway to delicious meals, delivered straight to your door!</p>

    <div class="search-container">
        <form action="/restaurants" method="get">
            <input type="text" id="search" name="search" placeholder="Search for a restaurant...">
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="btn-container">
        <a href="/restaurants" class="btn">View All Restaurants</a>
        <a href="/restaurants/add" class="btn">Add New Restaurant</a>
    </div>

    <%-- Logging Example --%>
    <script>
        console.log("Index page loaded successfully");
    </script>
</body>
</html>