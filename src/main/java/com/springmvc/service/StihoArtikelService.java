package com.springmvc.service;


import com.springmvc.dao.StihoArtikelDAO;
import com.springmvc.model.StihoArtikel;
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
public class StihoArtikelService {
    
    @Autowired
    private StihoArtikelDAO stihoArtikelDAO;

    public void addStihoArtikel(StihoArtikel stihoArtikel) {
        stihoArtikelDAO.addStihoArtikel(stihoArtikel);
    }

    public void updateStihoArtikel(StihoArtikel stihoArtikel) {
        stihoArtikelDAO.updateStihoArtikel(stihoArtikel);
    }

    public StihoArtikel getStihoArtikel(int id) {
        return stihoArtikelDAO.getStihoArtikel(id);
    }

    public void deleteStihoArtikel(int id) {
        stihoArtikelDAO.deleteStihoArtikel(id);
    }

    public List<StihoArtikel> getStihoArtikels() {
        return stihoArtikelDAO.getStihoArtikels();
    }

    public void storeAllStihoArtikels(List<StihoArtikel> stihoArtikels) {
        stihoArtikelDAO.StoreAllStihoArtikels(stihoArtikels);
    }
}
