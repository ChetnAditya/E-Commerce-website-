<%@ taglib uri="<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h2>Available Products</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>
                        <a href="editProduct?id=${product.id}">Edit</a> |
                        <a href="deleteProduct?id=${product.id}" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h2>Available Products</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>
                        <a href="editProduct?id=${product.id}">Edit</a> |
                        <a href="deleteProduct?id=${product.id}" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

