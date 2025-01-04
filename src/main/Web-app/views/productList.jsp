Here’s how to use JSTL (JavaServer Pages Standard Tag Library) and Expression Language (EL) in your Maven-based Java Web project using JSP pages:


---

1. Add Dependencies for JSTL

In your pom.xml, add the JSTL dependency:

<dependencies>
    <!-- JSTL Dependency -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>jstl</artifactId>
        <version>1.2</version>
    </dependency>

    <!-- Servlet API (if not already added) -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope>
    </dependency>
</dependencies>

Run mvn clean install to download the dependencies.


---

2. Set Up the Project Directory Structure

Ensure your Maven project has the following structure:

src/main/
├── java/com/example/ecommerce
│       ├── model/Product.java
│       ├── model/User.java
│       ├── dao/ProductDAO.java
│       ├── service/ProductService.java
│       ├── controller/ProductController.java
├── resources/
├── webapp/
│       ├── WEB-INF/
│       │       ├── web.xml
│       ├── pages/
│       │       ├── product.jsp
│       │       ├── productList.jsp
│       │       ├── userProfile.jsp


---

3. JSTL and EL in JSP Pages

Example 1: productList.jsp

This page displays a list of products using JSTL and EL.

<%@ taglib uri="http://127.0.0.1:3000/E-Commerce%20Website/index.html" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through the list of products using JSTL -->
            <c:forEach var="product" items="${productList}">
                <tr>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
