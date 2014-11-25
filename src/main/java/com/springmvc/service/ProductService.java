package com.springmvc.service;

import com.springmvc.dao.ProductDAO;
import com.springmvc.model.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductService {

    @Autowired
    private ProductDAO productDAO;

    public void addProduct(Product product) {
        productDAO.addProduct(product);

    }

    public void updateProduct(Product product) {
        productDAO.updateProduct(product);
    }

    public Product getProduct(int id) {
        return productDAO.getProduct(id);
    }

    public void deleteProduct(int id) {
        productDAO.deleteProduct(id);
    }

    public List<Product> getProducts() {
        return productDAO.getProducts();
    }

    public void storeAllProducts(List<Product> products) {
        productDAO.StoreAllProducts(products);
    }
}
