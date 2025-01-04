
package com.example.ecommerce.dao;

import com.example.ecommerce.model.Product;
import org.junit.jupiter.api.*;
import java.sql.*;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class ProductDAOTest {

    private static Connection connection;
    private ProductDAO productDAO;

    @BeforeAll
    public static void setupDatabase() throws Exception {
        // Set up H2 in-memory database
        connection = DriverManager.getConnection("jdbc:h2:mem:testdb", "sa", "");
        try (Statement statement = connection.createStatement()) {
            // Create products table
            statement.execute("CREATE TABLE products (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY," +
                    "name VARCHAR(255) NOT NULL," +
                    "price DOUBLE NOT NULL" +
                    ")");
        }
    }

    @BeforeEach
    public void setup() {
        // Initialize the DAO with a custom connection (H2 database)
        productDAO = new ProductDAO() {
            @Override
            protected Connection getConnection() throws SQLException {
                return connection;
            }
        };
    }

    @AfterEach
    public void cleanUp() throws SQLException {
        // Clear the products table after each test
        try (Statement statement = connection.createStatement()) {
            statement.execute("TRUNCATE TABLE products");
        }
    }

    @AfterAll
    public static void tearDownDatabase() throws Exception {
        // Close the connection
        if (connection != null) {
            connection.close();
        }
    }

    @Test
    public void testAddProduct() throws SQLException {
        Product product = new Product("Laptop", 75000.00);

        // Call the DAO method
        productDAO.addProduct(product);

        // Verify the product was added
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM products")) {
            assertTrue(resultSet.next());
            assertEquals("Laptop", resultSet.getString("name"));
            assertEquals(75000.00, resultSet.getDouble("price"));
        }
    }

    @Test
    public void testGetAllProducts() {
        // Insert test data
        productDAO.addProduct(new Product("Laptop", 75000.00));
        productDAO.addProduct(new Product("Phone", 25000.00));

        // Call the DAO method
        List<Product> products = productDAO.getAllProducts();

        // Verify the result
        assertEquals(2, products.size());
        assertEquals("Laptop", products.get(0).getName());
        assertEquals(75000.00, products.get(0).getPrice());
        assertEquals("Phone", products.get(1).getName());
        assertEquals(25000.00, products.get(1).getPrice());
    }

    @Test
    public void testGetProductById() {
        // Insert test data
        productDAO.addProduct(new Product("Laptop", 75000.00));

        // Call the DAO method
        Product product = productDAO.getProductById(1);

        // Verify the result
        assertNotNull(product);
        assertEquals("Laptop", product.getName());
        assertEquals(75000.00, product.getPrice());
    }

    @Test
    public void testUpdateProduct() {
        // Insert test data
        Product product = new Product("Laptop", 75000.00);
        productDAO.addProduct(product);

        // Update the product
        product.setName("Gaming Laptop");
        product.setPrice(85000.00);
        productDAO.updateProduct(product);

        // Verify the update
        Product updatedProduct = productDAO.getProductById(1);
        assertEquals("Gaming Laptop", updatedProduct.getName());
        assertEquals(85000.00, updatedProduct.getPrice());
    }

    @Test
    public void testDeleteProduct() {
        // Insert test data
        productDAO.addProduct(new Product("Laptop", 75000.00));

        // Delete the product
        productDAO.deleteProduct(1);

        // Verify the product was deleted
        Product product = productDAO.getProductById(1);
        assertNull(product);
    }
}
