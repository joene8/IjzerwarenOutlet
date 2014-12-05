package com.springmvc.service;

/**
 *
 * @author gebak_000
 */
import com.springmvc.dao.OrderDAO;
import com.springmvc.model.Order;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderService {

    @Autowired
    private OrderDAO orderDAO;

    public void addOrder(Order order) {
        orderDAO.addOrder(order);
    }

    public void updateOrder(Order order) {
        orderDAO.updateOrder(order);
    }

    public Order getOrder(int id) {
        return orderDAO.getOrder(id);
    }

    public void deleteOrder(int id) {
        orderDAO.deleteOrder(id);
    }

    public List<Order> getOrders() {
        return orderDAO.getOrders();
    }

    public void storeAllOrders(List<Order> orders) {
        orderDAO.StoreAllOrders(orders);
    }
}
