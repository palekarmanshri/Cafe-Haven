<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Processing Checkout</title>
    <script>
        function orderSuccess() {
            alert("Order placed successfully! Redirecting to payment...");
        }
    </script>
</head>
<body onload="orderSuccess()">
<%
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String paymentMethod = request.getParameter("payment_method");
    String dbURL = "jdbc:mysql://localhost:3306/cafe";
    String dbUser = "root";
    String dbPassword = "";
    Connection conn = null;
    PreparedStatement orderStmt = null;
    PreparedStatement detailStmt = null;
    Statement stmt = null;
    ResultSet rs = null;
    int orderId = 1;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String getLastOrder = "SELECT MAX(order_id) AS last_id FROM orders";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(getLastOrder);
        if (rs.next() && rs.getInt("last_id") > 0) {
            orderId = rs.getInt("last_id") + 1;
        }
        String insertOrder = "INSERT INTO orders (order_id, name, address, email, phone, payment_method) VALUES (?, ?, ?, ?, ?, ?)";
        orderStmt = conn.prepareStatement(insertOrder);
        orderStmt.setInt(1, orderId);
        orderStmt.setString(2, name);
        orderStmt.setString(3, address);
        orderStmt.setString(4, email);
        orderStmt.setString(5, phone);
        orderStmt.setString(6, paymentMethod);
        orderStmt.executeUpdate();
        String getCartItems = "SELECT product_name, price, quantity FROM cart";
        rs = stmt.executeQuery(getCartItems);
        String insertDetails = "INSERT INTO order_details (order_id, product_name, price, quantity) VALUES (?, ?, ?, ?)";
        detailStmt = conn.prepareStatement(insertDetails);
        while (rs.next()) {
            detailStmt.setInt(1, orderId);
            detailStmt.setString(2, rs.getString("product_name"));
            detailStmt.setDouble(3, rs.getDouble("price"));
            detailStmt.setInt(4, rs.getInt("quantity"));
            detailStmt.executeUpdate();
        }
        String clearCart = "DELETE FROM cart";
        stmt.executeUpdate(clearCart);
        response.sendRedirect("payment.jsp?order_id=" + orderId);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (orderStmt != null) orderStmt.close();
            if (detailStmt != null) detailStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>
