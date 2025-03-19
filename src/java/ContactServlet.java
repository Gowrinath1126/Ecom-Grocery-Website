import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String subject = request.getParameter("subject").trim();
        String message = request.getParameter("message").trim();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO contacts (name, email, subject, message) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, subject.isEmpty() ? null : subject);
            pstmt.setString(4, message);
            
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h2>Thank you! Your message has been received.</h2>");
                out.println("<h6><a href='index.jsp'>Continue Shopping</a></h6>");
            } else {
                out.println("<h2>Something went wrong.</h2>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    }
}
