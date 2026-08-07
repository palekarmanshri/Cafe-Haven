<%@ page import="java.sql.*" %>
<%
    String productName = request.getParameter("product_name");
    String dbURL = "jdbc:mysql://localhost:3306/cafe";
    String dbUser = "root";
    String dbPassword = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String sql = "DELETE FROM cart WHERE product_name = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, productName);
        int rows = stmt.executeUpdate();
        if (rows > 0) {
            response.sendRedirect("cart.jsp"); 
        }
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
