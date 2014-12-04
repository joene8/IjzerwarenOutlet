package com.springmvc.dao;

import com.springmvc.model.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void addProduct(Product product) {
        getCurrentSession().save(product);
    }

    public void updateProduct(Product product) {
        Product productToUpdate = getProduct(product.getId());
        productToUpdate.setArtikelNummer(product.getArtikelNummer());
        productToUpdate.setName(product.getName());
        productToUpdate.setDescription(product.getDescription());
        productToUpdate.setAddition(product.isAddition());
        productToUpdate.setAdditionDescription(product.getAdditionDescription());
        productToUpdate.setDiscountPercentage(product.getDiscountPercentage());
        productToUpdate.setPicture(product.getPicture());
        productToUpdate.setNetThickness(product.getNetThickness());
        productToUpdate.setNetWidth(product.getNetWidth());
        productToUpdate.setProductLength(product.getProductLength());
        productToUpdate.setGrossWeight(product.getGrossWeight());
        productToUpdate.setStandardSalePrice(product.getStandardSalePrice());
        getCurrentSession().update(productToUpdate);
    }

    public Product getProduct(int id) {
        Product product = (Product) getCurrentSession().get(Product.class, id);
        return product;
    }

    public void deleteProduct(int id) {
        Product productToDelete = getProduct(id);
        if (productToDelete != null) {
            getCurrentSession().delete(productToDelete);
        }

    }

    public List<Product> getProducts() {
        return getCurrentSession().createQuery("from Product").list();
    }

    public void StoreAllProducts(List<Product> products) {

        for (Product product : products) {
            getCurrentSession().save(product);
        }
    }

}
