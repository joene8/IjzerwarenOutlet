package com.springmvc.dao;

import com.springmvc.model.Establishment;
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
public class EstablishmentDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void addEstablishment(Establishment establishment) {
        getCurrentSession().save(establishment);
    }

    public void updateEstablishment(Establishment establishment) {
        Establishment establishmentToUpdate = getEstablishment(establishment.getId());
        establishmentToUpdate.setName(establishment.getName());
        establishmentToUpdate.setCity(establishment.getCity());
        establishmentToUpdate.setPhoneNumber(establishment.getPhoneNumber());
        establishmentToUpdate.setPostalCode(establishment.getPostalCode());
        establishmentToUpdate.setStreetName(establishment.getStreetName());
        establishmentToUpdate.setStreetNumber(establishment.getStreetNumber());
        establishmentToUpdate.setStreetNumberSuffix(establishment.getStreetNumberSuffix());
        
        getCurrentSession().update(establishmentToUpdate);
    }

    public Establishment getEstablishment(int id) {
        Establishment establishment = (Establishment) getCurrentSession().get(Establishment.class, id);
        return establishment;
    }

    public void deleteEstablishment(int id) {
        Establishment establishmentToDelete = getEstablishment(id);
        if (establishmentToDelete != null) {
            getCurrentSession().delete(establishmentToDelete);
        }

    }

    public List<Establishment> getEstablishments() {
        return getCurrentSession().createQuery("from Establishment").list();
    }

    public void StoreAllEstablishments(List<Establishment> establishments) {

        for (Establishment establishment : establishments) {
            getCurrentSession().save(establishment);
        }
    }

}
