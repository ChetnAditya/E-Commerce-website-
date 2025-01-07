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
