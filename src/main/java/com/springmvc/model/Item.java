/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.model;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author jaron
 */
@Entity
public class Item implements Serializable {

    @Id
    @GeneratedValue
    private int id;
    private float chosenPrice;
    private int stock;
    private boolean addition;
    private String additionDescription;
    private int discountPercentage;

    @ManyToOne
    private Product product;
    @ManyToOne
    private Establishment establishment;
    
    @OneToMany(mappedBy="item")
    private Set<ItemOrder> itemOrder;

    public Item() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Establishment getEstablishment() {
        return establishment;
    }

    public void setEstablishment(Establishment establishment) {
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

    public boolean isAddition() {
        return addition;
    }

    public void setAddition(boolean addition) {
        this.addition = addition;
    }

    public String getAdditionDescription() {
        return additionDescription;
    }

    public void setAdditionDescription(String additionDescription) {
        this.additionDescription = additionDescription;
    }

    public int getDiscountPercentage() {
        return discountPercentage;
    }

    public void setDiscountPercentage(int discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    public Set<ItemOrder> getItemOrder() {
        return itemOrder;
    }

    public void setItemOrder(Set<ItemOrder> itemOrder) {
        this.itemOrder = itemOrder;
    }

}
