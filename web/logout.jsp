<%@ page import="javax.servlet.http.*" %>
<%
    HttpSession Session = request.getSession(false);
    if (Session != null) {
        Session.invalidate();
    }
    response.sendRedirect("index.jsp");
%>
