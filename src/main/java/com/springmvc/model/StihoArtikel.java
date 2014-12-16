package com.springmvc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author jaron
 */
@Entity
public class StihoArtikel {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private int artikelnummer;
    private String categorie;
    private int nettoDikte;
    private int nettoBreedte;
    private int artikelLengte;
    private double brutoGewicht;
    private double standaardVerkoopprijs;
    
    @OneToOne(mappedBy = "productNumber")
    private Product product;

    // Constructor
    public StihoArtikel() {

    }

    // Getters and setters for the different attributes of this model 
    public int getArtikelnummer() {
        return artikelnummer;
    }

    public void setArtikelnummer(int artikelnummer) {
        this.artikelnummer = artikelnummer;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    public int getNettoDikte() {
        return nettoDikte;
    }

    public void setNettoDikte(int nettoDikte) {
        this.nettoDikte = nettoDikte;
    }

    public int getNettoBreedte() {
        return nettoBreedte;
    }

    public void setNettoBreedte(int nettoBreedte) {
        this.nettoBreedte = nettoBreedte;
    }

    public int getArtikelLengte() {
        return artikelLengte;
    }

    public void setArtikelLengte(int artikelLengte) {
        this.artikelLengte = artikelLengte;
    }

    public double getBrutoGewicht() {
        return brutoGewicht;
    }

    public void setBrutoGewicht(double brutoGewicht) {
        this.brutoGewicht = brutoGewicht;
    }

    public double getStandaardVerkoopprijs() {
        return standaardVerkoopprijs;
    }

    public void setStandaardVerkoopprijs(double standaardVerkoopprijs) {
        this.standaardVerkoopprijs = standaardVerkoopprijs;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    

}
