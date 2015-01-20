package com.springmvc.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.validation.constraints.*;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Order")
public class Cart implements Serializable {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private int id;
    @NotNull
    @OneToMany
    private List<Item> itemList;
    private double totalPrice;
    @ManyToOne
    private User client;
    private int cartAmount;
    //private boolean status;
    
    

    public Cart(int id, List<Item> itemList, double totalPrice, User client) {
        this.id = id; 
        this.itemList = itemList;
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

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
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
    public int getCartamount() {
        return cartAmount;
    }

    public void setCartamount(int cartamount) {
        this.cartAmount = cartamount;
        calculateCartAmount();
    }
    
    public void calculateTotalPrice(){
    
        double totalPrice=0;
        
        for(int i=0;i<this.itemList.size();i++){
            Item item = this.itemList.get(i);
            totalPrice += item.getChosenPrice();
        }
        
        this.totalPrice=totalPrice;
    }
    public void calculateCartAmount(){
        int cartAmount = 0;
//        cartAmount = this.itemList.size();
    }


}
