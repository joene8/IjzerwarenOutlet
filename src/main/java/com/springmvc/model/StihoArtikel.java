package com.springmvc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
    private double nettoDikte;
    private double nettoBreedte;
    private double artikelLengte;
    private double brutoGewicht;
    private double standaardVerkoopprijs;

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

    public double getNettoDikte() {
        return nettoDikte;
    }

    public void setNettoDikte(double nettoDikte) {
        this.nettoDikte = nettoDikte;
    }

    public double getNettoBreedte() {
        return nettoBreedte;
    }

    public void setNettoBreedte(double nettoBreedte) {
        this.nettoBreedte = nettoBreedte;
    }

    public double getArtikelLengte() {
        return artikelLengte;
    }

    public void setArtikelLengte(double artikelLengte) {
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

}
