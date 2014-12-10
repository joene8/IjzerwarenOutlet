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
      public void addItem(Item Item) {
        getCurrentSession().save(Item);
    }
      public void updateItem(Item item){
           Item itemToUpdate = getItem(item.getId());
          itemToUpdate.setProduct(item.getProduct());
          itemToUpdate.setEstablishment(item.getEstablishment());
          itemToUpdate.setChosenPrice(item.getChosenPrice());
          itemToUpdate.setStock(item.getStock());
          itemToUpdate.setAddition(item.isAddition());
          itemToUpdate.setAdditionDescription(item.getAdditionDescription());
          itemToUpdate.setDiscountPercentage(item.getDiscountPercentage());
          
          getCurrentSession().update(itemToUpdate);
      }
      
    public Item getItem(int id) {
        Item item = (Item) getCurrentSession().get(Item.class, id);
        return item;
    }

    public void deleteItem(int id) {
        Item itemToDelete = getItem(id);
        if (itemToDelete != null) {
            getCurrentSession().delete(itemToDelete);
        }

    }

    public List<Item> getItems() {
        return getCurrentSession().createQuery("from Item").list();
    }

    public void StoreAllItems(List<Item> items) {

        for (Item item : items) {
            getCurrentSession().save(item);
        }
    }
}
