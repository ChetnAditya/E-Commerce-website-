package ecom.example.db.ecom.example.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseConnection {
    public static void main(String[] args) {
        
        String url = "jdbc:mysql://localhost:3306/ecommerce";
        String username = "root"; 
        String password = "Arjun@8011";

        try {
            
            Connection connection = DriverManager.getConnection(url, username, password);
            System.out.println("Database connected successfully!");

            
            String query = "SELECT * FROM users";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

          
            while (resultSet.next()) {
                System.out.println("ID: " + resultSet.getInt("id"));
                System.out.println("Name: " + resultSet.getString("name"));
                System.out.println("Email: " + resultSet.getString("email"));
            }

       
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

