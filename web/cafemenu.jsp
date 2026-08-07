<!DOCTYPE HTML>
<html>
    <head>
        <title>Cafe Haven</title>
        <link rel="stylesheet" href="cart.css">
        <link rel="stylesheet" href="styles.css">
        <style>
            button{
                background-color:#512615;
            }
        </style>
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
    <main>
        <section id="banner">
            <div class="container container-full">
                <h1>Our<span>Menu</span></h1>  
            </div>
        </section>
        <section class="menu-wrapper ptb-100">
            <div class="container container-full">
                <div class="shop-content">
                    <div class="food-box">
                        <div class="pic">
                        <img src="assets/1.png" class="food-img" alt="Pizza">
                        </div>
                        <h2 class="food-title">Pizza</h2>
                        <span class="food-price">Rs.150</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Pizza">
                        <input type="hidden" name="price" value="150">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/2.png" class="food-img" alt="Mojito">
                        </div>
                        <h2 class="food-title">Mojito</h2>
                        <span class="food-price">Rs.50</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Mojito">
                        <input type="hidden" name="price" value="50">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/3.png" class="food-img" alt="Burger">
                        </div>
                        <h2 class="food-title">Burger</h2>
                        <span class="food-price">Rs.80</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Burger">
                        <input type="hidden" name="price" value="80">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/4.png" class="food-img" alt="Dalgona Coffee">
                        </div>
                        <h2 class="food-title">Dalgona Coffee</h2>
                        <span class="food-price">Rs.100</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Dalgona">
                        <input type="hidden" name="price" value="100">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/5.png" class="food-img" alt="Cappuccino">
                        </div>
                        <h2 class="food-title">Cappuccino</h2>
                        <span class="food-price">Rs.140</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Cappuccino">
                        <input type="hidden" name="price" value="140">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/6.png" class="food-img" alt="Tea">
                        </div>
                        <h2 class="food-title">Tea</h2>
                        <span class="food-price">Rs.40</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Tea">
                        <input type="hidden" name="price" value="40">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/7.png" class="food-img" alt="muffin">
                        </div>
                        <h2 class="food-title">Blueberry Muffin</h2>
                        <span class="food-price">Rs.60</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Blueberry Muffin">
                        <input type="hidden" name="price" value="60">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/8.png" class="food-img" alt="Iced Tea">
                        </div>
                        <h2 class="food-title">Iced Tea</h2>
                        <span class="food-price">Rs.80</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Iced Tea">
                        <input type="hidden" name="price" value="80">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/9.png" class="food-img" alt="Filter coffee">
                        </div>
                        <h2 class="food-title">Filter Coffee</h2>
                        <span class="food-price">Rs.60</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Filter Coffee">
                        <input type="hidden" name="price" value="60">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/10.png" class="food-img" alt="muffin">
                        </div>
                        <h2 class="food-title">Oreo Muffin</h2>
                        <span class="food-price">Rs.50</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Oreo Muffin">
                        <input type="hidden" name="price" value="50">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/11.png" class="food-img" alt="coffee">
                        </div>
                        <h2 class="food-title">Black Coffee</h2>
                        <span class="food-price">Rs.70</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Black Coffee">
                        <input type="hidden" name="price" value="70">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                    <div class="food-box">
                        <div class="pic">
                            <img src="assets/12.png" class="food-img" alt="coffee">
                        </div>
                        <h2 class="food-title">Mocha Coffee</h2>
                        <span class="food-price">Rs.120</span>
                        <form action="add_cart.jsp" method="post">
                        <input type="hidden" name="product_name" value="Mocha Coffee">
                        <input type="hidden" name="price" value="120">
                        <input type="hidden" name="quantity" value="1">
                        <button>
                        <ion-icon name="cart" class="add-cart" onclick="addToCart('Pizza', 150)">
                        <img src="assets/cart.svg" class="food-img" alt="Add to Cart">
                        </ion-icon>
                        </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <script src="script1.js"></script>
    </main>
    <div class="footer">
        <p> Copyright© Cafe Haven 2000. All rights reserved.</p>
    </div>
    </body>
</html>
