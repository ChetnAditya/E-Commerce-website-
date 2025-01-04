package com.example.ecommerce.service;

import com.example.ecommerce.model.Product;
import com.example.ecommerce.dao.ProductDAO;
import java.util.List;

public class ProductService {
    private ProductDAO productDAO = new ProductDAO();

    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public void addProduct(String name, double price) {
        Product product = new Product(name, price);
        productDAO.addProduct(product);
    }
}
