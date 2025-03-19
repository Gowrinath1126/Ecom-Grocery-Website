<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Successful</title>
    <style>
    body {
        background: linear-gradient(to right, #ff9966, #ff5e62);
        font-family: 'Poppins', sans-serif;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
        text-align: center;
        color: #fff;
    }

    h1 {
        font-size: 2.5rem;
        font-weight: bold;
        margin-bottom: 10px;
    }

    h2 {
        font-size: 1.5rem;
        font-weight: normal;
        margin-bottom: 20px;
    }

    button {
        background: linear-gradient(to right, #28a745, #218838);
        border: none;
        padding: 12px 20px;
        border-radius: 8px;
        font-size: 18px;
        font-weight: bold;
        color: white;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: linear-gradient(to right, #218838, #28a745);
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
    }

    a {
        text-decoration: none;
    }
</style>
</head>
<body>
    <center>
        <h1>🎉 Order Placed Successfully! 🎉</h1>
        <h2>Thank you! Your shipping details have been submitted successfully.</h2>
        <a href="index.jsp">
            <button>Go Back to Home</button>
        </a>
    </center>
</body>
</html>
