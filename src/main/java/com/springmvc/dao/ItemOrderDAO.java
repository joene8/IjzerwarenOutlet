package com.springmvc.dao;

import com.springmvc.model.ItemOrder;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author gebak_000
 */

@Repository
public class ItemOrderDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void addItemOrder(ItemOrder itemOrder) {
        getCurrentSession().save(itemOrder);
    }

    public void updateItemOrder(ItemOrder itemOrder) {
        ItemOrder itemOrderToUpdate = getItemOrder(itemOrder.getId());
        itemOrderToUpdate.setUser(itemOrder.getUser());
        itemOrderToUpdate.setId(itemOrder.getId());
        itemOrderToUpdate.setDate();
        itemOrderToUpdate.setAmount(itemOrder.getAmount());
        itemOrderToUpdate.setTotalPrice(itemOrder.getTotalPrice());
        itemOrderToUpdate.setShippingCosts(itemOrder.getShippingCosts());
//        itemOrderToUpdate.setProductEstablishment(order.getProductEstablishment());
        getCurrentSession().update(itemOrderToUpdate);
    }

    public ItemOrder getItemOrder(int id) {
        ItemOrder itemOrder = (ItemOrder) getCurrentSession().get(ItemOrder.class, id);
        return itemOrder;
    }

    public void deleteItemOrder(int id) {
        ItemOrder itemOrderToDelete = getItemOrder(id);
        if (itemOrderToDelete != null) {
            getCurrentSession().delete(itemOrderToDelete);
        }

    }

    public List<ItemOrder> getItemOrders() {
        return getCurrentSession().createQuery("from ItemOrder").list();
    }

    public void StoreAllItemOrders(List<ItemOrder> itemOrders) {

        for (ItemOrder itemOrder : itemOrders) {
            getCurrentSession().save(itemOrder);
        }
    }

}
