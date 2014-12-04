/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.dao;

import com.springmvc.model.ProductEstablishment;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author jaron
 */
@Repository
public class ProductEstablishmentDAO {
    @Autowired
    private SessionFactory sessionFactory;
    
     private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
      public void addProductEstablishment(ProductEstablishment ProductEstablishment) {
        getCurrentSession().save(ProductEstablishment);
    }
      public void updateProductEstablishment(ProductEstablishment ProductEstablishment){
          ProductEstablishment productEstablishmentToUpdate = getProductEstablishment(ProductEstablishment.getProduct());
          productEstablishmentToUpdate.setEstablishment(ProductEstablishment.getEstablishment());
          productEstablishmentToUpdate.setProduct(ProductEstablishment.getProduct());
          productEstablishmentToUpdate.setStock(ProductEstablishment.getStock());
          
          getCurrentSession().update(productEstablishmentToUpdate);
      }
      
    public ProductEstablishment getProductEstablishment(int id) {
        ProductEstablishment productEstablishment = (ProductEstablishment) getCurrentSession().get(ProductEstablishment.class, id);
        return productEstablishment;
    }

    public void deleteProductEstablishment(int id) {
        ProductEstablishment productEstablishmentToDelete = getProductEstablishment(id);
        if (productEstablishmentToDelete != null) {
            getCurrentSession().delete(productEstablishmentToDelete);
        }

    }

    public List<ProductEstablishment> getProductEstablishments() {
        return getCurrentSession().createQuery("from ProductEstablishment").list();
    }

    public void StoreAllProductEstablishments(List<ProductEstablishment> productEstablishments) {

        for (ProductEstablishment productEstablishment : productEstablishments) {
            getCurrentSession().save(productEstablishment);
        }
    }
}
