package com.springmvc.model;

import java.util.Calendar;
import java.io.Serializable;
import java.sql.Time;
import java.util.TimeZone;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

/**
 *
 * @author gebak_000
 */
@Entity
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private int amount;
    private float totalPrice;
    private float shippingCosts;
    private Calendar date;
    private Time time;
    private boolean delivery;
    private String destination;
    private boolean ready;
    private String handledBy;
    private int product;
    private int establishment;
    
    @ManyToOne
    @JoinColumn(name="user")
    private User user;


//    @ManyToOne
//    private ProductEstablishment productEstablishment;

    /*the TimeZone is no attribute for the order but is needed to get the current date.*/
    @Transient
    private TimeZone tz = TimeZone.getTimeZone("Europe/Amsterdam");

    // Constructor
    public Order() {
    }

    // Getters and setters for the different attributes of this model 
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

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public boolean isDelivery() {
        return delivery;
    }

    public void setDelivery(boolean delivery) {
        this.delivery = delivery;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public boolean isReady() {
        return ready;
    }

    public void setReady(boolean ready) {
        this.ready = ready;
    }

    public String getHandledBy() {
        return handledBy;
    }

    public void setHandledBy(String handledBy) {
        this.handledBy = handledBy;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
