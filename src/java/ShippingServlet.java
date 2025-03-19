import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ShippingServlet")
public class ShippingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String landmark = request.getParameter("landmark");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_db", "netbeans_user", "root");

            // Insert data into shipping table
            String query = "INSERT INTO shipping_details (name, mobile, email, address, city, pincode, landmark) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, mobile);
            pstmt.setString(3, email);
            pstmt.setString(4, address);
            pstmt.setString(5, city);
            pstmt.setString(6, pincode);
            pstmt.setString(7, landmark);

            int rows = pstmt.executeUpdate();
            conn.close();

            // Redirect to success page
            if (rows > 0) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
