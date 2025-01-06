const CartItems = document.querySelector(".cart-items");

let cartTotal = 0;
function displayCartItems() {
  const items = JSON.parse(localStorage.getItem("cart"));
  items.forEach((item) => {
    const cartItem = document.createElement("div");
    cartItem.className = "cart_item";
    cartItem.innerHTML = `
    <p class="cart_id">${item.id}</p>
              <p class="cart_title">${item.title}</p>
              <img src="${item.image}" alt="${item.title}" class="cart_img" />
              <p class="cart_price">${item.price}</p>
              <p class="cart_delete">Delete</p>
    `;
    CartItems.appendChild(cartItem);
  });
}

displayCartItems();


document.getElementById("checkout-form").addEventListener("submit", (event) => {
  event.preventDefault();

  const formData = {
      name: document.getElementById("name").value,
      email: document.getElementById("email").value,
      address: document.getElementById("address").value,
  };

  // Here, you can send the data to the backend
  console.log("Checkout data:", formData);

  // Clear cart after checkout
  localStorage.removeItem("cart");
  alert("Payment successful! Thank you for your order.");
  window.location.href = "index.html";
});


