package com.springmvc.service;

import com.springmvc.dao.ProductEstablishmentDAO;
import com.springmvc.model.ProductEstablishment;
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
public class ProductEstablishmentService {
    @Autowired
    private ProductEstablishmentDAO productEstablishmentDAO;
    
    
    public void addProductEstablishment(ProductEstablishment productEstablishment) {
        productEstablishmentDAO.addProductEstablishment(productEstablishment);
    }

    public void updateProductEstablishment(ProductEstablishment productEstablishment) {
        productEstablishmentDAO.updateProductEstablishment(productEstablishment);
    }

    public ProductEstablishment getProductEstablishment(int id) {
        return productEstablishmentDAO.getProductEstablishment(id);
    }

    public void deleteProductEstablishment(int id) {
        productEstablishmentDAO.deleteProductEstablishment(id);
    }

    public List<ProductEstablishment> getProductEstablishments() {
        return productEstablishmentDAO.getProductEstablishments();
    }

    public void storeAllProductEstablishments(List<ProductEstablishment> productEstablishments) {
        productEstablishmentDAO.StoreAllProductEstablishments(productEstablishments);
    }
}
