

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Cafe Haven</title>
        <link rel="stylesheet" href="cart.css">
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="LOGIN.css">
    </head>
    <body>
     <div class="header">
        <div class="logo"><img src="assets/Cafe Logo.png" width="100" height="100" alt="Cafe Logo"></div>
         <div class="nav-buttons">
           <button><a href="index.html">Home</a></button>
           <button><a href="about1.jsp">About</a></button>
           <button><a href="Register.jsp">Register</a></button>
           <button><a href="LOGIN.jsp">Log In</a></button>
           <button><a href="cart.jsp">Cart</a></button>
         </div>
     </div>
        <section id="banner">
        <section class="menu-wrapper ptb-100">
            <div class="container container-full">
                <section id="Login" class="login-section ptb-100">
                    <div class="container">
                        <div class="head"> <h3>LOGIN</h3> </div>
                    <form action="LoginForm" method="post" class="login-form">
                        <div class="input-group">
                            <label for="username">Name:</label>
                            <input type="text" name="name" required>
                        </div>
                        
                        <div class="input-group">
                            <label for="password">Password:</label>
                            <input type="password" name="passw" required>
                        </div>
                        <button type="submit">Login</button><br>
                        <br>
                    </form>
                    <p class="register-link">Don't have an account? <a href="Register.jsp">Register here</a></p>
                    </div>
                </section>
            </div>
        </section>
    </section>
        <script src="script1.js"></script>
        <div class="footer">
        <p> Copyright© Cafe Haven 2000. All rights reserved.</p>
    </div>
    </body>
</html>
