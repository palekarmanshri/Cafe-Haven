<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="header">
        <div class="logo"><img src="assets/Cafe Logo.png" width="100" height="100" alt="Cafe Logo"></div>
        <div class="nav-buttons">
            <button><a href="index.html">Home</a></button>
            <button><a href="about1.jsp">About</a></button>
            <button><a href="cafemenu.jsp">Menu</a></button>
            <button><a href="index1.html">Log Out</a></button>
        </div>
    </div>
    <h1>Your Cart</h1>
    <table border="1">
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Action</th>
        </tr>

        <%
            String dbURL = "jdbc:mysql://localhost:3306/cafe";
            String dbUser = "root";
            String dbPassword = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                String sql = "SELECT product_name, price, quantity FROM cart";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                double totalAmount = 0;
                while (rs.next()) {
                    String productName = rs.getString("product_name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    double total = price * quantity;
                    totalAmount += total;
        %>
        <tr>
            <td><%= productName %></td>
            <td>Rs.<%= price %></td>
            <td><%= quantity %></td>
            <td>Rs.<%= total %></td>
            <td><button4><a href="remove_cart.jsp?product_name=<%= productName %>">Remove</a></button4></td>
        </tr>
        <%
                }
        %>
        <tr>
            <td colspan="3"><strong>Total Amount</strong></td>
            <td><strong>Rs.<%= totalAmount %></strong></td>
            <td><button1><a href="checkout.jsp">Checkout</a></button1></td>
        </tr>
        <%
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
