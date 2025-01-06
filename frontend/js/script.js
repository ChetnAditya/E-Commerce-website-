// Select the video element
const video = document.getElementById("myVideo");

// Play video function
function playVideo() {
    video.play();
}

// Pause video function
function pauseVideo() {
    video.pause();
}

function reduceVideoSize() {
    const video = document.getElementById('videoFrame');
    video.style.width = '80px'; // Reduce width
    video.style.height = '200'; // Maintain aspect ratio
}


// Toggle animation on the video
function toggleAnimation() {
    if (video.style.animation) {
        video.style.animation = ""; // Remove animation
    } else {
        video.style.animation = "bounce 2s infinite"; // Add bounce animation
    }
}

// Bounce animation keyframes
const style = document.createElement("style");
style.textContent = `
@keyframes bounce {
    0%, 100% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-20px);
    }
}`;
document.head.appendChild(style);

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

const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.json());

// Endpoint to handle checkout
app.post("/checkout", (req, res) => {
    const { name, email, address } = req.body;

    // Simulate payment processing (e.g., integrate Stripe or PayPal here)
    console.log(`Processing payment for ${name} (${email}) at ${address}`);
    
    res.json({ success: true, message: "Payment processed successfully!" });
});

app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});


// Mock user details
const user = {
    name: "John Doe",
    email: "john.doe@example.com",
    orders: [
        { id: 1, date: "2025-01-01", total: "$120" },
        { id: 2, date: "2025-01-02", total: "$80" },
    ]
};

// Populate user details
document.getElementById("user-name").textContent = user.name;
document.getElementById("user-email").textContent = user.email;

// Populate order history
const orderList = document.getElementById("order-list");
user.orders.forEach(order => {
    const li = document.createElement("li");
    li.textContent = `Order #${order.id} - ${order.date} - Total: ${order.total}`;
    orderList.appendChild(li);
});

// Edit account details
document.getElementById("edit-account").addEventListener("click", () => {
    const newName = prompt("Enter your new name:", user.name);
    const newEmail = prompt("Enter your new email:", user.email);
    if (newName) user.name = newName;
    if (newEmail) user.email = newEmail;

    // Update UI
    document.getElementById("user-name").textContent = user.name;
    document.getElementById("user-email").textContent = user.email;

    alert("Account details updated successfully!");
});
