<%@ taglib uri="http://127.0.0.1:3000/E-Commerce%20Website/index.html" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
    <h2>Add a New Product</h2>
    <form action="addProduct" method="post">
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="price">Product Price:</label>
        <input type="number" id="price" name="price" step="0.01" required><br><br>

        <button type="submit">Add Product</button>
    </form>
</body>
</html>

