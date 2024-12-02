function validateRegistrationForm() {
  let isValid = true;

  // Validate Name
  const name = document.getElementById('name').value.trim();
  if (name === "") {
      document.getElementById('name-error').innerText = "Name is required.";
      isValid = false;
  } else {
      document.getElementById('name-error').innerText = "";
  }

  // Validate Email
  const email = document.getElementById('email').value.trim();
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
      document.getElementById('email-error').innerText = "Enter a valid email.";
      isValid = false;
  } else {
      document.getElementById('email-error').innerText = "";
  }

  // Validate Mobile
  const mobile = document.getElementById('mobile').value.trim();
  if (!/^[0-9]{10}$/.test(mobile)) {
      document.getElementById('mobile-error').innerText = "Enter a valid mobile number.";
      isValid = false;
  } else {
      document.getElementById('mobile-error').innerText = "";
  }

  // Validate Passwords
  const password = document.getElementById('password').value.trim();
  const confirmPassword = document.getElementById('confirm-password').value.trim();
  if (password.length < 6) {
      document.getElementById('password-error').innerText = "Password must be at least 6 characters.";
      isValid = false;
  } else if (password !== confirmPassword) {
      document.getElementById('confirm-password-error').innerText = "Passwords do not match.";
      isValid = false;
  } else {
      document.getElementById('password-error').innerText = "";
      document.getElementById('confirm-password-error').innerText = "";
  }

  return isValid;
}


// Sample Product Data
const products = [
  { id: 1, name: 'Laptop', price: 800, image: 'assets/images/laptop.jpg' },
  { id: 2, name: 'Smartphone', price: 600, image: 'assets/images/phone.jpg' },
  { id: 3, name: 'Smart Watch', price: 150, image: 'assets/images/smartwatch.jpg' },
  { id: 4, name: 'Headphones', price: 100, image: 'assets/images/headphones.jpg' },
];

// Render Featured Products
const productContainer = document.getElementById('featured-products');
if (productContainer) {
  products.forEach(product => {
      const productCard = `
          <div class="col-md-3 mb-4">
              <div class="card h-100">
                  <img src="${product.image}" class="card-img-top" alt="${product.name}">
                  <div class="card-body">
                      <h5 class="card-title">${product.name}</h5>
                      <p class="card-text">$${product.price}</p>
                      <button class="btn btn-warning w-100" onclick="addToCart(${product.id})">Add to Cart</button>
                  </div>
              </div>
          </div>
      `;
      productContainer.innerHTML += productCard;
  });
}

// Cart Functionality
let cart = [];
function addToCart(productId) {
  const product = products.find(p => p.id === productId);
  cart.push(product);
  alert(${product.name} added to cart!);
}

