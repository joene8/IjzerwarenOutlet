/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

/**
 *
 * @author jaron
 */
@Entity @IdClass(ProductEstablishmentPK.class)
public class ProductEstablishment implements Serializable {
    @Id
    private int product;
    @Id
    private int establishment;
    private float chosenPrice;
    private int stock;

    public ProductEstablishment() {
    }

    public int getProduct() {
        return product;
    }

    public void setProduct(int product) {
        this.product = product;
    }

    public int getEstablishment() {
        return establishment;
    }

    public void setEstablishment(int establishment) {
        this.establishment = establishment;
    }

    public float getChosenPrice() {
        return chosenPrice;
    }

    public void setChosenPrice(float chosenPrice) {
        this.chosenPrice = chosenPrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    
}
