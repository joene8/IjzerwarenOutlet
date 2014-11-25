package com.springmvc.service;

import com.springmvc.dao.EstablishmentDAO;
import com.springmvc.model.Establishment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EstablishmentService {

    @Autowired
    private EstablishmentDAO establishmentDAO;

    public void addEstablishment(Establishment establishment) {
        establishmentDAO.addEstablishment(establishment);
    }

    public void updateEstablishment(Establishment establishment) {
        establishmentDAO.updateEstablishment(establishment);
    }

    public Establishment getEstablishment(int id) {
        return establishmentDAO.getEstablishment(id);
    }

    public void deleteEstablishment(int id) {
        establishmentDAO.deleteEstablishment(id);
    }

    public List<Establishment> getEstablishments() {
        return establishmentDAO.getEstablishments();
    }

    public void storeAllEstablishments(List<Establishment> establishments) {
        establishmentDAO.StoreAllEstablishments(establishments);
    }
}
