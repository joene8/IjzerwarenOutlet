/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.dao;

import com.springmvc.model.Item;
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
public class ItemDAO {
    @Autowired
    private SessionFactory sessionFactory;
    
     private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
      public void addProductEstablishment(Item ProductEstablishment) {
        getCurrentSession().save(ProductEstablishment);
    }
      public void updateProductEstablishment(Item ProductEstablishment){
          Item productEstablishmentToUpdate = getProductEstablishment(ProductEstablishment.getProduct());
          productEstablishmentToUpdate.setEstablishment(ProductEstablishment.getEstablishment());
          productEstablishmentToUpdate.setProduct(ProductEstablishment.getProduct());
          productEstablishmentToUpdate.setStock(ProductEstablishment.getStock());
          
          getCurrentSession().update(productEstablishmentToUpdate);
      }
      
    public Item getProductEstablishment(int id) {
        Item productEstablishment = (Item) getCurrentSession().get(Item.class, id);
        return productEstablishment;
    }

    public void deleteProductEstablishment(int id) {
        Item productEstablishmentToDelete = getProductEstablishment(id);
        if (productEstablishmentToDelete != null) {
            getCurrentSession().delete(productEstablishmentToDelete);
        }

    }

    public List<Item> getProductEstablishments() {
        return getCurrentSession().createQuery("from ProductEstablishment").list();
    }

    public void StoreAllProductEstablishments(List<Item> productEstablishments) {

        for (Item productEstablishment : productEstablishments) {
            getCurrentSession().save(productEstablishment);
        }
    }
}
