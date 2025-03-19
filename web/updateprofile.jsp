<%@ page import="java.sql.*" %>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/ecommerce_db";
    String dbUser = "netbeans_user";
    String dbPassword = "root";

    String email = (String) session.getAttribute("userEmail");
    String currentPassword = request.getParameter("currentPassword");
    String newPassword = request.getParameter("newPassword");

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Verify current password
        String checkSql = "SELECT password FROM users WHERE email = ?";
        PreparedStatement checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setString(1, email);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next()) {
            String storedPassword = rs.getString("password");

            if (!storedPassword.equals(currentPassword)) {
                out.println("<script>alert('Incorrect Current Password!'); window.location='profile.jsp';</script>");
                return;
            }

            // Update new password
            String updateSql = "UPDATE users SET password = ? WHERE email = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
            updateStmt.setString(1, newPassword);
            updateStmt.setString(2, email);

            int updated = updateStmt.executeUpdate();
            if (updated > 0) {
                out.println("<script>alert('Password Updated Successfully!'); window.location='profile.jsp';</script>");
            } else {
                out.println("<script>alert('Error Updating Password!'); window.location='profile.jsp';</script>");
            }
        }

        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
