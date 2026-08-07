<%@ page import="java.sql.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/cafe";
    String dbUser = "root";
    String dbPassword = "";
    String productName = request.getParameter("product_name");
    String price = request.getParameter("price");
    String quantity = request.getParameter("quantity");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String sql = "INSERT INTO cart (product_name, price, quantity) VALUES (?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, productName);
        stmt.setString(2, price);
        stmt.setString(3, quantity);
        int rows = stmt.executeUpdate();
        if (rows > 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Item added to cart successfully!');");
            out.println("window.location.href = 'cafemenu.jsp';"); 
            out.println("</script>");
        }
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    }
%>
