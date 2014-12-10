package com.springmvc.service;

import com.springmvc.dao.ItemDAO;
import com.springmvc.model.Item;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author jaron
 */

@Service
@Transactional
public class ItemService {
    @Autowired
    private ItemDAO itemDAO;
    
    
    public void addItem(Item item) {
        itemDAO.addItem(item);
    }

    public void updateItem(Item item) {
        itemDAO.updateItem(item);
    }

    public Item getItem(int id) {
        return itemDAO.getItem(id);
    }

    public void deleteItem(int id) {
        itemDAO.deleteItem(id);
    }

    public List<Item> getItems() {
        return itemDAO.getItems();
    }

    public void storeAllItems(List<Item> items) {
        itemDAO.StoreAllItems(items);
    }
}
