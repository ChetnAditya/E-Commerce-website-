### E-Commerce-Application
The E-Commerce Application is built using Java and Spring Boot, with security, scalability, and ease of maintenance. The backend uses Spring Data JPA to interact with a MySQL database, making it easy to manage and store important entities such as users, products, categories, orders, and more. User authentication is handled by Auth0, providing secure and reliable means of REST APIs.

The APIs are well-documented and easily accessible through Swagger UI, making it simple for developers to test and understand the various endpoints. Overall, this project provides secure Rest APIs to create a scalable platform for businesses to sell their products to customers.

### Setup
1. Create a MySQL database named `ecommerce_db`.
2. Update `db.properties` in `resources` with your database credentials.
3. Run the project using an IDE or command line.
4. Add database to java connection in `java/ecom/example/db`.

## Features
- Admin:-
- Login
- Users
- Address
- Categories
- Products
- Price & discount
-Orders


# User:-
- Registration & Login
- Fetch categories and products based on category
- Adding & deleting products to cart
- Managing address and products quantity
- Ordering products and fetching order status


## Security
The API is secured using JSON Web Tokens (JWT) handled by Auth0. To access the API, you will need to obtain a JWT by authenticating with the /login endpoint. The JWT should then be passed in the Authorize option available in the Swagger-ui.

## Technologies:
- Java 17 or above
- Spring Boot 3.0
- Maven
- MySQL
- Spring Data JPA
- Spring Security
- JSON Web Tokens (JWT)
- Auth0
- Swagger UI


## Running the app
- Clone the repository: git clone https://github.com/ChetnAditya/E-Commerce-website-.git
- Import the project into STS:
- Click File > Import...
- Select Maven > Existing Maven Projects and click Next
- Browse to the project directory and click Finish
- Update the values in application.properties with your MySQL database connection details.
- Run the app: Right-click the project in the Package Explorer and click Run As > Spring Boot App.