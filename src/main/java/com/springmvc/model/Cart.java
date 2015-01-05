package com.springmvc.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.validation.constraints.*;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Order")
public class Cart implements Serializable {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private int id;
    @NotNull
    @OneToMany
    private List<Product> productList;
    private double totalPrice;
    @ManyToOne
    private User client;
    //private boolean status;
    
    

    public Cart(int id, List<Product> productList, double totalPrice, User client) {
        this.id = id; 
        this.productList = productList;
        this.totalPrice = totalPrice;
        this.client = client;
    }

    public Cart() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
        calculateTotalPrice();
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public User getClient() {
        return client;
    }

    public void setClient(User client) {
        this.client = client;
    }

    public void calculateTotalPrice(){
    
        double totalPrice=0;
        
        for(int i=0;i<this.productList.size();i++){
            Product product = this.productList.get(i);
            totalPrice += product.getStandardSalePrice();
        }
        
        this.totalPrice=totalPrice;
    }


}
