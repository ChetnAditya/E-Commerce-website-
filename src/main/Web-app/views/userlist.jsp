<%@ taglib uri="http://127.0.0.1:3000/E-Commerce%20Website/index.html" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
</head>
<body>
    <h2>Registered Users</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Username</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
