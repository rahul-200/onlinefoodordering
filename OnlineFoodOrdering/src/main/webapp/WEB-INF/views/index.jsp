<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to Korporate Kitchen</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e0e0e0);
            color: #333;
            text-align: center;
            padding: 50px;
            margin: 0;
        }
        h1 {
            font-family: 'Pacifico', cursive;
            font-size: 48px;
            color: #ff5733;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }
        .search-container {
            margin-bottom: 20px;
        }
        .container {
            padding: 20px;
            border-radius: 10px;
            display: inline-block;
            width: 60%;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            background: #ff5733;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
            margin: 5px;
        }
        .btn:hover {
            background: #ff2e00;
        }
        input[type="text"] {
            padding: 10px;
            width: 250px;
            border: none;
            border-radius: 5px;
            text-align: center;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }
        button {
            padding: 10px 15px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        button:hover {
            background: #218838;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
</head>
<body>
    <div class="search-container">
        <form action="/restaurants" method="get">
            <input type="text" id="search" name="search" placeholder="Search for a restaurant...">
            <button type="submit">Search</button>
        </form>
    </div>
    
    <div class="container">
        <h1>Welcome to Korporate Kitchen</h1>
        <p>Your gateway to delicious meals, delivered straight to your door!</p>
        
        <h2>Manage Restaurants</h2>
        <p><a href="/restaurants" class="btn">View All Restaurants</a></p>
        <p><a href="/restaurants/add" class="btn">Add New Restaurant</a></p>
    </div>

    <%-- Logging Example --%>
    <script>
        console.log("Index page loaded successfully");
    </script>
</body>
</html>
