/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.model;

import java.io.Serializable;

/**
 *
 * @productId jaron
 */
public class ItemPK implements Serializable {

    int product;
    int establishment;

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ItemPK other = (ItemPK) obj;
        if (this.product != other.product) {
            return false;
        }
        if (this.establishment != other.establishment) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + this.product;
        hash = 53 * hash + this.establishment;
        return hash;
    }

}
