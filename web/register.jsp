
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Registration Form with MySQL</title>
    <link rel="stylesheet" href="reg.css">
</head>
<body>
<div class="wrapper">
    <h2>Registration</h2>
    <form action="register.jsp" method="post">
        <div class="input-box">
            <input type="text" name="name" placeholder="Enter your name" required>
        </div>
        <div class="input-box">
            <input type="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-box">
            <input type="password" name="password" placeholder="Create password" required>
        </div>
        <div class="input-box">
            <input type="password" name="confirmPassword" placeholder="Confirm password" required>
        </div>
        <div class="policy">
            <input type="checkbox" name="terms" required>
            <h3>I accept all terms & conditions</h3>
        </div>
        <div class="input-box button">
            <input type="submit" value="Register Now">
        </div>
        <div class="text">
            <h3>Already have an account? <a href="login.jsp">Login now</a></h3>
        </div>
    </form>

    <%
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/ecommerce_db";
        String dbUser = "netbeans_user";
        String dbPassword = "root";

        // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (request.getMethod().equalsIgnoreCase("POST")) {
            if (password.equals(confirmPassword)) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

                    // Check if email already exists
                    PreparedStatement checkUser = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
                    checkUser.setString(1, email);
                    ResultSet rs = checkUser.executeQuery();

                    if (rs.next()) {
                        out.println("<p style='color:red;'>You are already registered! Please <a href='login.jsp'>Login</a></p>");
                    } else {
                        // Insert user into database
                        PreparedStatement stmt = conn.prepareStatement("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
                        stmt.setString(1, name);
                        stmt.setString(2, email);
                        stmt.setString(3, password); // You should hash the password in real applications
                        stmt.executeUpdate();

                        out.println("<p style='color:green;'>Registration successful! You can <a href='login.jsp'>Login here</a></p>");
                    }

                    conn.close();
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Database Error: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p style='color:red;'>Passwords do not match!</p>");
            }
        }
    %>
</div>
</body>
</html>
