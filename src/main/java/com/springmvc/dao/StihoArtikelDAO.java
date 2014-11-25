package com.springmvc.dao;

import com.springmvc.model.StihoArtikel;
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
public class StihoArtikelDAO {
    
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void addStihoArtikel(StihoArtikel stihoArtikel) {
        getCurrentSession().save(stihoArtikel);
    }

    public void updateStihoArtikel(StihoArtikel stihoArtikel) {
        StihoArtikel stihoArtikelToUpdate = getStihoArtikel(stihoArtikel.getArtikelnummer());
        stihoArtikelToUpdate.setCategorie(stihoArtikel.getCategorie());
        stihoArtikelToUpdate.setNettoDikte(stihoArtikel.getNettoDikte());
        stihoArtikelToUpdate.setNettoBreedte(stihoArtikel.getNettoBreedte());
        stihoArtikelToUpdate.setArtikelLengte(stihoArtikel.getArtikelLengte());
        stihoArtikelToUpdate.setBrutoGewicht(stihoArtikel.getBrutoGewicht());
        stihoArtikelToUpdate.setStandaardVerkoopprijs(stihoArtikel.getStandaardVerkoopprijs());

        getCurrentSession().update(stihoArtikelToUpdate);

    }

    public StihoArtikel getStihoArtikel(int id) {
        StihoArtikel stihoArtikel = (StihoArtikel) getCurrentSession().get(StihoArtikel.class, id);
        return stihoArtikel;
    }

    public StihoArtikel getStihoArtikel(String email) {
        StihoArtikel stihoArtikel = (StihoArtikel) getCurrentSession().get(StihoArtikel.class, email);
        return stihoArtikel;
    }

    public void deleteStihoArtikel(int id) {
        StihoArtikel stihoArtikel = getStihoArtikel(id);
        if (stihoArtikel != null) {
            getCurrentSession().delete(stihoArtikel);
        }
    }

    @SuppressWarnings("unchecked")
    public List<StihoArtikel> getStihoArtikels() {
        return getCurrentSession().createQuery("from StihoArtikel").list();
    }

    public void StoreAllStihoArtikels(List<StihoArtikel> stihoArtikels) {

        for (StihoArtikel stihoArtikel : stihoArtikels) {
            getCurrentSession().save(stihoArtikel);
        }

    }
}
