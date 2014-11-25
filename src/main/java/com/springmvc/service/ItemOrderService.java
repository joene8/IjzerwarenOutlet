package com.springmvc.service;

/**
 *
 * @author gebak_000
 */
import com.springmvc.dao.ItemOrderDAO;
import com.springmvc.model.ItemOrder;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ItemOrderService {

    @Autowired
    private ItemOrderDAO itemOrderDAO;

    public void addItemOrder(ItemOrder itemOrder) {
        itemOrderDAO.addItemOrder(itemOrder);
    }

    public void updateItemOrder(ItemOrder itemOrder) {
        itemOrderDAO.updateItemOrder(itemOrder);
    }

    public ItemOrder getItemOrder(int id) {
        return itemOrderDAO.getItemOrder(id);
    }

    public void deleteItemOrder(int id) {
        itemOrderDAO.deleteItemOrder(id);
    }

    public List<ItemOrder> getItemOrders() {
        return itemOrderDAO.getItemOrders();
    }

    public void storeAllItemOrders(List<ItemOrder> itemOrders) {
        itemOrderDAO.StoreAllItemOrders(itemOrders);
    }
}
