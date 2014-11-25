package com.springmvc.model;

import java.util.Calendar;
import java.io.Serializable;
import java.util.TimeZone;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

/**
 *
 * @author gebak_000
 */
@Entity
public class ItemOrder implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private int amount;
    private float totalPrice;
    private float shippingCosts;
    private Calendar date;
    private User user;
//    @ManyToOne
//    private ProductEstablishment productEstablishment;

    /*the TimeZone is no attribute for the order but is needed to get the current date.*/
    @Transient
    private TimeZone tz = TimeZone.getTimeZone("Europe/Amsterdam");

    // Constructor
    public ItemOrder() {
    }

    // Getters and setters for the different attributes of this model 
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public float getShippingCosts() {
        return shippingCosts;
    }

    public void setShippingCosts(float shippingCosts) {
        this.shippingCosts = shippingCosts;
    }

    public Calendar getDate() {
        return date;
    }

    public void setDate() {
        date = Calendar.getInstance(tz);
    }

//    public ProductEstablishment getProductEstablishment() {
//        return productEstablishment;
//    }
//
//    public void setProductEstablishment(ProductEstablishment productEstablishment) {
//        this.productEstablishment = productEstablishment;
//    }    
}
