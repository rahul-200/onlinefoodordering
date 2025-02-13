<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Restaurant</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            color: #333;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #fff;
            font-size: 32px;
            font-weight: 600;
            margin-top: 50px;
            margin-bottom: 30px;
        }
        .form-container {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.1);
            width: 60%;
            margin: 0 auto;
            transform: translateY(50px);
            transition: transform 0.3s ease;
        }
        .form-container:hover {
            transform: translateY(0);
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="time"] {
            padding: 10px 12px;
            margin: 10px 0;
            width: 100%;
            max-width: 380px;
            border: 2px solid #ff7e5f;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="time"]:focus {
            border-color: #feb47b;
            outline: none;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #ff7e5f;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #feb47b;
            transform: translateY(-3px);
        }
        input[type="submit"]:active {
            transform: translateY(0);
        }
        input[type="submit"]:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <h1>Add Restaurant</h1>
    
    <div class="form-container">
        <form action="/restaurants/add" method="post">
            Name: <input type="text" name="restaurantName" required placeholder="Enter restaurant name"/><br>
            User Name: <input type="text" name="userName" required placeholder="Enter owner username"/><br>
            Email: <input type="email" name="email" required placeholder="Enter email address"/><br>
            Password: <input type="password" name="password" required placeholder="Enter password"/><br>
            Contact: <input type="text" name="contact" placeholder="Enter contact number"/><br>
            Address: <input type="text" name="address" placeholder="Enter address"/><br>
            Open Hours: <input type="time" name="openHours"/><br>
            Close Hours: <input type="time" name="closeHours"/><br>
            
            <input type="submit" value="Add Restaurant"/>
        </form>
    </div>
</body>
</html>
