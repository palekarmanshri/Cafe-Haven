<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <div class="header">
        <div class="logo"><img src="assets/Cafe Logo.png" width="100" height="100" alt="Cafe Logo"></div>
        <div class="nav-buttons">
            <button><a href="index.html">Home</a></button>
            <button><a href="about1.jsp">About</a></button>
            <button><a href="index.html">Log Out</a></button>
        </div>
    </div>
    <h1>Checkout</h1>
    <h3>Order Summary</h3>
    <table border="1">
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>

        <%
            String dbURL = "jdbc:mysql://localhost:3306/cafe";
            String dbUser = "root";
            String dbPassword = "";
            double totalAmount = 0;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                String sql = "SELECT product_name, price, quantity FROM cart";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
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
        </tr>
        <%
                }

        %>
        <tr>
            <td colspan="3"><strong>Total Amount</strong></td>
            <td><strong>Rs.<%= totalAmount %></strong></td>
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

    <h3>Billing Information</h3>
    <form action="process_checkout.jsp" method="post">
        <div class="box1">
            <div class="input">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required><br><br>
            </div>
            <div class="input">
                <label for="address">Shipping Address:</label>
                <input type="text" id="address" name="address" required><br><br>
            </div>
            <div class="input">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" required><br><br>
            </div>
            <div class="input">
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required><br><br>
            </div>
            <div class="input">
                <label for="payment_method">Payment Method:
                <select id="payment_method" name="payment_method" required>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                    <option value="PayPal">PayPal</option>
                </select><br><br>
            </div>
            <div class="input">
            <button type="submit">Proceed to Payment</button>
            </div>
        </div>
    </form>
</body>
</html>
