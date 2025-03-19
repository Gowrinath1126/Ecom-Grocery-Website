<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>

<%
    // Retrieving form data
    String queryType = request.getParameter("queryType");
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String message = request.getParameter("message");

    // Simple form validation
    if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty() || message == null || message.trim().isEmpty()) {
        out.println("<h2>Error: Please fill in all required fields.</h2>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Submitted</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 500px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: green;
        }
        p {
            font-size: 16px;
            color: #333;
        }
        strong {
            color: #555;
        }
        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            color: white;
            background: #007bff;
            border-radius: 5px;
            font-size: 16px;
            transition: 0.3s;
        }
        .back-button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Thank you, <%= name %>!</h2>
    <p>Your message has been received.</p>
    <p><strong>Query Type:</strong> <%= queryType %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Phone:</strong> <%= phone %></p>
    <p><strong>Message:</strong> <%= message %></p>

    <a href="contact.jsp" class="back-button">Go Back</a>
</div>

</body>
</html>
