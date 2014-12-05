package com.springmvc.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.validation.constraints.*;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product implements Serializable {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private int id;
    @NotNull
    private int artikelNummer;
    private String name;
    private String description;
    private String picture;
    private Double netThickness;
    private Double netWidth;
    private Double productLength;
    private Double grossWeight;
    private Double standardSalePrice;
    
    // Constructor
    public Product(){
        
    }

    // Getters and setters for the different attributes of this model 
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getArtikelNummer() {
        return artikelNummer;
    }

    public void setArtikelNummer(int artikelNummer) {
        this.artikelNummer = artikelNummer;
    }

    public Double getNetThickness() {
        return netThickness;
    }

    public void setNetThickness(Double netThickness) {
        this.netThickness = netThickness;
    }

    public Double getNetWidth() {
        return netWidth;
    }

    public void setNetWidth(Double netWidth) {
        this.netWidth = netWidth;
    }

    public Double getProductLength() {
        return productLength;
    }

    public void setProductLength(Double productLength) {
        this.productLength = productLength;
    }

    public Double getGrossWeight() {
        return grossWeight;
    }

    public void setGrossWeight(Double grossWeight) {
        this.grossWeight = grossWeight;
    }

    public Double getStandardSalePrice() {
        return standardSalePrice;
    }

    public void setStandardSalePrice(Double standardSalePrice) {
        this.standardSalePrice = standardSalePrice;
    }
}
