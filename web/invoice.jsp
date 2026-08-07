<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Invoice - Cafe Haven</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .invoice-container {
            width: 70%;
            margin: auto;
            border: 2px solid #333;
            padding: 20px;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .invoice-header {
            text-align: center;
        }
        .invoice-header h1 {
            color: #333;
        }
        .invoice-header h2{
                font-family: "Times New Roman";
    color: #512615;
    font-size: 50px;
    font-weight: 200;
    margin-top: 10px;
    margin-bottom: 10px;
    text-align: center;
        }
        .invoice-details {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .invoice-details th, .invoice-details td {
            border: 1px solid #333;
            padding: 10px;
            text-align: left;
        }
        .invoice-summary {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .invoice-summary th, .invoice-summary td {
            border: 1px solid #333;
            padding: 10px;
        }
        .total-amount {
            font-weight: bold;
        }
        .print-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .print-button button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
        }
        h2{
            font-family: "Times New Roman";
            color: #512615;
    font-size: 30px;
    font-weight: 200;
    margin-top: 10px;
    margin-bottom: 10px;
    text-align: center;
        }
    </style>
    <script>
        function printInvoice() {
            window.print();
        }
    </script>
</head>
<body>
<%
    String orderId = request.getParameter("order_id");
    System.out.println("Order ID: " + orderId); 
    String dbURL = "jdbc:mysql://localhost:3306/cafe";
    String dbUser = "root";
    String dbPassword = "";

    String customerName = request.getParameter("name");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String paymentMethod = request.getParameter("payment_method");
    String orderDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    StringBuilder cartDetails = new StringBuilder();
    double totalAmount = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        String orderQuery = "SELECT name, address, email, phone, payment_method, order_date FROM orders WHERE order_id = ?";
        PreparedStatement orderStmt = conn.prepareStatement(orderQuery);
        orderStmt.setString(1, orderId);
        ResultSet orderRs = orderStmt.executeQuery();

        if (orderRs.next()) {
            System.out.println("Customer Name: " + orderRs.getString("name"));
            customerName = orderRs.getString("name");
            address = orderRs.getString("address");
            email = orderRs.getString("email");
            phone = orderRs.getString("phone");
            paymentMethod = orderRs.getString("payment_method");
            orderDate = orderRs.getString("order_date");
        } else {
            System.out.println("No order found for Order ID: " + orderId);
        }

        String itemsQuery = "SELECT product_name, price, quantity FROM order_details WHERE order_id = ?";
        PreparedStatement itemsStmt = conn.prepareStatement(itemsQuery);
        itemsStmt.setString(1, orderId);
        ResultSet itemsRs = itemsStmt.executeQuery();
%>

<div class="invoice-container">
    <div class="invoice-header">
        <h1>Invoice</h1>
        <h2>Cafe Haven</h2>
        <p>Email: support@cafehaven.com | Phone: +91-9876543210</p>
    </div>
    <table class="invoice-details">
        <tr>
            <th>Order ID</th>
            <td><%= orderId %></td>
        </tr>
        <tr>
            <th>Date</th>
            <td><%= orderDate %></td>
        </tr>
        <tr>
            <th>Customer</th>
            <td><%= customerName %></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><%= address %></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><%= email %></td>
        </tr>
        <tr>
            <th>Phone</th>
            <td><%= phone %></td>
        </tr>
        <tr>
            <th>Payment Method</th>
            <td><%= paymentMethod %></td>
        </tr>
    </table>
    <h2>Order Summary</h2>
    <table class="invoice-summary">
        <tr>
            <th>Product</th>
            <th>Price (Rs.)</th>
            <th>Quantity</th>
            <th>Total (Rs.)</th>
        </tr>

<%
        while (itemsRs.next()) {
            String productName = itemsRs.getString("product_name");
            double price = itemsRs.getDouble("price");
            int quantity = itemsRs.getInt("quantity");
            double total = price * quantity;
            totalAmount += total;
            System.out.println("Product: " + productName + ", Price: " + price + ", Quantity: " + quantity + ", Total: " + total);
%>
        <tr>
            <td><%= productName %></td>
            <td><%= price %></td>
            <td><%= quantity %></td>
            <td><%= total %></td>
        </tr>
<%
        }
%>
        <tr>
            <td colspan="3" class="total-amount">Total Amount</td>
            <td class="total-amount">Rs. <%= totalAmount %></td>
        </tr>
    </table>
    <div class="print-button">
        <button onclick="printInvoice()">Print Invoice</button>
    </div>
</div>

<%
        orderRs.close();
        itemsRs.close();
        orderStmt.close();
        itemsStmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>
