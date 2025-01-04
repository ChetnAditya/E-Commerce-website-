<%@ taglib uri="http://127.0.0.1:3000/E-Commerce%20Website/index.html" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h2>User Profile</h2>
    
    <!-- Display user information -->
    <form action="updateProfile" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" value="${user.username}" readonly><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" value="${user.password}" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${user.email}" required><br><br>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="${user.phone}" required><br><br>

        <button type="submit">Update Profile</button>
    </form>

    <p>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </p>
</body>
</html>
