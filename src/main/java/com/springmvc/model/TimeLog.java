/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.model;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

/**
 *
 * @author How Fei Zheng
 */
@Entity
public class TimeLog implements Serializable {

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    private int id;
    @NotNull
    private Timestamp login;
    @NotNull
    private Timestamp logout;
    
    @NotNull
    private int user;

    public TimeLog() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getLogin() {
        return login;
    }

    public void setLogin(Timestamp login) {
        this.login = login;
    }

    public Timestamp getLogout() {
        return logout;
    }

    public void setLogout(Timestamp logout) {
        this.logout = logout;
    }

    public int getUserID() {
        return user;
    }

    public void setUserID(int user) {
        this.user = user;
    }

    

}
