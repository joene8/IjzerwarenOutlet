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
    private ItemDAO productEstablishmentDAO;
    
    
    public void addProductEstablishment(Item productEstablishment) {
        productEstablishmentDAO.addProductEstablishment(productEstablishment);
    }

    public void updateProductEstablishment(Item productEstablishment) {
        productEstablishmentDAO.updateProductEstablishment(productEstablishment);
    }

    public Item getProductEstablishment(int id) {
        return productEstablishmentDAO.getProductEstablishment(id);
    }

    public void deleteProductEstablishment(int id) {
        productEstablishmentDAO.deleteProductEstablishment(id);
    }

    public List<Item> getProductEstablishments() {
        return productEstablishmentDAO.getProductEstablishments();
    }

    public void storeAllProductEstablishments(List<Item> productEstablishments) {
        productEstablishmentDAO.StoreAllProductEstablishments(productEstablishments);
    }
}
