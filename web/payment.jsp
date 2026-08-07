<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String totalAmount =request.getParameter("totalAmount");
    String order_id =request.getParameter("order_id");
    String paymentMethod = request.getParameter("payment_method");

    String orderId =request.getParameter("orderId");
    String dbURL = "jdbc:mysql://localhost:3306/cafe";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String query = "SELECT MAX(order_id) AS order_id FROM orders";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        if (rs.next()) {
            orderId = rs.getString("order_id");
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <title>Cafe Haven</title>
    <script>
        function showPopup() {
            alert("Payment Successful! Your order has been placed.");
            window.location.href = "invoice.jsp?order_id=<%= request.getParameter("order_id") %>";
        }
    </script>
        <link rel="stylesheet" href="cart.css">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
     <div class="header">
        <div class="logo"><img src="assets/Cafe Logo.png" width="100" height="100" alt="Cafe Logo"></div>
         <div class="nav-buttons">
           <button><a href="homepage.html">Home</a></button>
           <button><a href="about1.jsp">About</a></button>
           <button><a href="Register.jsp">Register</a></button>
           <button><a href="LOGIN.jsp">Log In</a></button>
           <button><a href="cart.jsp">Cart</a></button>
           
         </div>
     </div>
    <h1>Payment Gateway</h1>
    <div class="box1">
    <p>Order ID: <%= orderId %></p>
    <p>Amount:<%= totalAmount %></p>
    <form action="invoice.jsp" method="post">
        <div class="input">
        <input type="hidden" name="order_id" value="<%= orderId %>">
        <label for="card_number">Card Number:</label>
        <input type="text" id="card_number" name="card_number" required><br><br>
        </div>
        <div class="input">
        <label for="expiry_date">Expiry Date:</label>
        <input type="month" id="expiry_date" name="expiry_date" required><br><br>
        </div>       
        <div class="input">
        <label for="cvv">CVV:</label>
        <input type="password" id="cvv" name="cvv" required><br><br>
        </div>
        <button2 type="submit" onclick="showPopup()">Pay Now</button2>
    </form>
    </div> 
</body>
</html>
