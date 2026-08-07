

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Cafe Haven</title>
        <link rel="stylesheet" href="cart.css">
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="REGISTER.css">
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
                <section id="Register" class="register-section ptb-100">
                    <div class="container">
                        <div class="head" ><h3>REGISTER</h3></div>
                    <form action="RegForm" method="post" class="register-form">
                        <div class="input-group">
                            <label for="username">Name:</label>
                            <input type="text" name="name" required>
                        </div>
                        <div class="input-group">
                            <label for="email">Email:</label>
                            <input type="email" name="email" required>
                        </div>
                        <div class="input-group">
                            <label for="password">Password:</label>
                            <input type="password" name="passw" required>
                        </div>
                        <div class="input-group">
                            <div class="gender-option">
                            <label>Gender:</label>
                            <div class="gender-option">
                            <input type="radio" id="male" name="gender" value="Male">
                            <label for="male">Male</label>
                            </div>
                            <div class="gender-option">
                            <input type="radio" id="female" name="gender" value="Female">
                            <label for="female">Female</label>
                            </div>
                            </div>
                        </div>
                        <div class="input-group">
                            <label for="City">City:
                                <select name="city">
                               <option>Select City</option>
                               <option>Panvel</option>
                               <option>Kamothe</option>
                               <option>Kharghar</option>
                               <option>Mumbai</option>
                                 </select><br/><br/>
                        </div>
                        <button type="submit">Register</button>
                    </form>
                    
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
