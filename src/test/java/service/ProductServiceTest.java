
package com.example.ecommerce.service;

import com.example.ecommerce.dao.ProductDAO;
import com.example.ecommerce.model.Product;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class ProductServiceTest {

    private ProductService productService;
    private ProductDAO productDAO;

    @BeforeEach
    public void setup() {
        productDAO = Mockito.mock(ProductDAO.class); // Mock the DAO layer
        productService = new ProductService(productDAO); // Inject the mock into the service
    }

    @Test
    public void testAddProduct() {
        Product product = new Product("Laptop", 75000.00);

        // Simulate behavior for adding a product
        doNothing().when(productDAO).addProduct(product);

        // Call the method
        productService.addProduct(product);

        // Verify if the DAO's addProduct method was called
        verify(productDAO, times(1)).addProduct(product);
    }

    @Test
    public void testGetAllProducts() {
        // Mock the return value of getAllProducts
        List<Product> products = Arrays.asList(
                new Product("Laptop", 75000.00),
                new Product("Phone", 25000.00)
        );
        when(productDAO.getAllProducts()).thenReturn(products);

        // Call the service method
        List<Product> result = productService.getAllProducts();

        // Assertions
        assertNotNull(result);
        assertEquals(2, result.size());
        assertEquals("Laptop", result.get(0).getName());
        assertEquals(75000.00, result.get(0).getPrice());
        assertEquals("Phone", result.get(1).getName());
        assertEquals(25000.00, result.get(1).getPrice());

        // Verify if the DAO's getAllProducts method was called
        verify(productDAO, times(1)).getAllProducts();
    }

    @Test
    public void testGetProductById() {
        // Mock the return value of getProductById
        Product product = new Product("Laptop", 75000.00);
        when(productDAO.getProductById(1)).thenReturn(product);

        // Call the service method
        Product result = productService.getProductById(1);

        // Assertions
        assertNotNull(result);
        assertEquals("Laptop", result.getName());
        assertEquals(75000.00, result.getPrice());

        // Verify if the DAO's getProductById method was called
        verify(productDAO, times(1)).getProductById(1);
    }

    @Test
    public void testUpdateProduct() {
        Product product = new Product("Laptop", 75000.00);

        // Simulate behavior for updating a product
        doNothing().when(productDAO).updateProduct(product);

        // Call the service method
        productService.updateProduct(product);

        // Verify if the DAO's updateProduct method was called
        verify(productDAO, times(1)).updateProduct(product);
    }

    @Test
    public void testDeleteProduct() {
        // Simulate behavior for deleting a product
        doNothing().when(productDAO).deleteProduct(1);

        // Call the service method
        productService.deleteProduct(1);

        // Verify if the DAO's deleteProduct method was called
        verify(productDAO, times(1)).deleteProduct(1);
    }
}
