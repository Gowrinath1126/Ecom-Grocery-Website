<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Database connection details
    String jdbcUrl = "jdbc:mysql://localhost:3306/ecommerce_db";
    String dbUser = "netbeans_user";
    String dbPassword = "root";
    
    // Get the logged-in user's email from session
    String userEmail = (String) session.getAttribute("userEmail");

    // Redirect to login if user is not logged in
    if (userEmail == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch user details from database
    String username = "", password = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        String sql = "SELECT username, password FROM users WHERE email = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, userEmail);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            username = rs.getString("username");
            password = rs.getString("password");
        }
        
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        .container { width: 40%; margin: 50px auto; background: white; padding: 20px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h2 { text-align: center; }
        label { font-weight: bold; }
        input[type="text"], input[type="password"] { width: 100%; padding: 8px; margin: 5px 0; }
        button { width: 100%; padding: 10px; background: #28a745; color: white; border: none; cursor: pointer; }
        button:hover { background: #218838; }
    </style>
</head>
<body>

<div class="container">
    <h2>User Profile</h2>
    <form action="updateProfile.jsp" method="post">
        <label>Username:</label>
        <input type="text" name="username" value="<%= username %>" readonly>

        <label>Email:</label>
        <input type="text" name="email" value="<%= userEmail %>" readonly>

        <label>Current Password:</label>
        <input type="password" name="currentPassword" required>

        <label>New Password:</label>
        <input type="password" name="newPassword" required>

        <button type="submit">Change Password</button>
    </form>
</div>

</body>
</html>
