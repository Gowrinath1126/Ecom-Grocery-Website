import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateProfileServlet")
public class updateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_db", "netbeans_user", "root");

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE users SET name=?, email=?, phone=?, address=?, city=?, pincode=? WHERE username=?");

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, city);
            ps.setString(6, pincode);
            ps.setString(7, username);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                session.setAttribute("message", "Profile updated successfully!");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("profile.jsp");
    }
}
