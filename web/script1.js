/* global fetch */

function addCart() {
  var food = this.parentElement;
  var title = food.querySelector('.food-title').innerText;
  var price = parseFloat(food.querySelector('.food-price').innerText.replace("Rs.", "").trim());
  var imgSrc = food.querySelector('.food-img').src;

  var newProduct = { title: title, price: price, imgSrc: imgSrc };
  if (itemList.some(function (el) {
    return el.title === title;
  })) {
    alert("Product already added to cart");
    return;
  }
  itemList.push(newProduct);
  fetch("AddToCart.jsp", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: `product_name=${encodeURIComponent(title)}&price=${price}&quantity=1`,
  })
    .then(function (response) {
      if (!response.ok) {
        throw new Error("Failed to add item to cart");
      }
      return response.text();
    })
    .then(function () {
      console.log("Item added to the database successfully.");
    })
    .catch(function (err) {
      console.error("Error adding item to cart:", err);
    });
}
function placeOrder() {
  if (itemList.length === 0) {
    alert("Your cart is empty. Please add items before placing an order.");
    return;
  }
  var totalAmount = parseFloat(document.querySelector(".total-price").innerText.replace("Rs.", ""));
  var orderDetails = { 
    itemList: itemList, 
    totalAmount: totalAmount, 
    paymentMethod: "COD" 
  };
  if (confirm("Do you want to place the order?")) {
    fetch("PlaceOrder.jsp", { 
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: `orderDetails=${encodeURIComponent(JSON.stringify(orderDetails))}`,
    })
      .then(function (response) {
        if (!response.ok) {
          throw new Error("Failed to place the order");
        }
        return response.text();
      })
      .then(function (orderId) {
        if (orderId) {
          alert("Order placed successfully!");
          console.log("Order response:", orderId);
          clearCart();

          window.location.href = `payment_gateway.jsp?orderId=${orderId}&amount=${totalAmount}`;
        } else {
          alert("Failed to retrieve order ID. Please try again.");
        }
      })
      .catch(function (err) {
        console.error("Error placing order:", err);
        alert("An error occurred while placing the order. Please try again.");
      });
  }
}
function clearCart() {
  itemList = [];
  document.querySelector(".cart-content").innerHTML = "";
  updateTotal();
}
