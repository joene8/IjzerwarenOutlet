package com.springmvc.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.validation.constraints.*;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Product implements Serializable {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private int id;
    @NotNull
    private String name;
    private String description;
    private String picture;
    private int netThickness;
    private int netWidth;
    private int productLength;
    private Double grossWeight;
    private Double standardSalePrice;
    
    @OneToOne
    private StihoArtikel productNumber;
    
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

    public int getNetThickness() {
        return netThickness;
    }

    public void setNetThickness(int netThickness) {
        this.netThickness = netThickness;
    }

    public int getNetWidth() {
        return netWidth;
    }

    public void setNetWidth(int netWidth) {
        this.netWidth = netWidth;
    }

    public int getProductLength() {
        return productLength;
    }

    public void setProductLength(int productLength) {
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

    public StihoArtikel getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(StihoArtikel productNumber) {
        this.productNumber = productNumber;
    }

    
    
}
