<%@ taglib uri="http://127.0.0.1:3000/E-Commerce%20Website/index.html" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
    <h2>Edit Product</h2>
    <form action="updateProduct" method="post">
        <input type="hidden" name="id" value="${product.id}">
        
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" value="${product.name}" required><br><br>

        <label for="price">Product Price:</label>
        <input type="number" id="price" name="price" value="${product.price}" step="0.01" required><br><br>

        <button type="submit">Update Product</button>
    </form>
</body>
</html>

