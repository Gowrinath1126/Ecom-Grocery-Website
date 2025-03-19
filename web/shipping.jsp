<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shipping Details</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(to right, #ff9966, #ff5e62); /* Gradient background */
            font-family: 'Poppins', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #333;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 600;
            color: #555;
        }

        .form-control {
            border-radius: 8px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            transition: 0.3s;
        }

        .form-control:focus {
            border-color: #ff5e62;
            box-shadow: 0 0 8px rgba(255, 94, 98, 0.5);
        }

        button {
            background: linear-gradient(to right, #ff5e62, #ff9966);
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            width: 100%;
            transition: 0.3s;
            cursor: pointer;
        }

        button:hover {
            background: linear-gradient(to right, #ff9966, #ff5e62);
            box-shadow: 0 3px 10px rgba(255, 94, 98, 0.5);
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Enter Your Shipping Details</h2>
        <form action="ShippingServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mobile Number:</label>
                <input type="text" name="mobile" class="form-control" required pattern="[0-9]{10}" title="Enter a valid 10-digit mobile number">
            </div>
            <div class="mb-3">
                <label class="form-label">Email ID:</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Address:</label>
                <textarea name="address" class="form-control" required></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">City:</label>
                <input type="text" name="city" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Pincode:</label>
                <input type="text" name="pincode" class="form-control" required pattern="[0-9]{6}" title="Enter a valid 6-digit pincode">
            </div>
            <div class="mb-3">
                <label class="form-label">Landmark:</label>
                <input type="text" name="landmark" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary w-100">Submit</button>
        </form>
    </div>
</body>
</html>
