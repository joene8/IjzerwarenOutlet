/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.model;

/**
 *
 * @author Deva
 */
public class Validation {

    public static boolean lettersMin(String name, int min) {
        return name.matches("^[a-zA-Z]{" + min + ",}$");
    }

    public static boolean lettersMin(String name, int min, int max) {
        return name.matches("^[a-zA-Z]{" + min + "," + max + "}$");
    }

    public static boolean lettersExact(String name, int exact) {
        return name.matches("^[a-zA-Z]{" + exact + "}$");
    }

    public static boolean numbersMin(String name, int min) {
        return name.matches("^\\d{" + min + ",}$");
    }

    public static boolean numbersMin(String name, int min, int max) {
        return name.matches("^\\d{" + min + "," + max + "}$");
    }

    public static boolean numbersExact(String name, int exact) {
        return name.matches("^\\d{" + exact + "}$");
    }

    public static boolean wordCharactersMin(String name, int min) {
        return name.matches("^\\w{" + min + ",}$");
    }

    public static boolean wordCharactersMin(String name, int min, int max) {
        return name.matches("^\\w{" + min + "," + max + "}$");
    }

    public static boolean wordCharactersExact(String name, int exact) {
        return name.matches("^\\w{" + exact + "}$");
    }

    public static boolean allMin(String name, int min) {
        return name.matches("^.{" + min + ",}$");
    }

    public static boolean allMin(String name, int min, int max) {
        return name.matches("^.{" + min + "," + max + "}$");
    }

    public static boolean allExact(String name, int exact) {
        return name.matches("^.{" + exact + "}$");
    }
    
    public static boolean streetAndCity(String streetAndCity){
        return streetAndCity.matches("^[a-zA-Z .']{2,}$");
    }

    public static boolean email(String email) {
        return email.matches("^\\w+@\\w+\\.\\w{2,}$");
    }

    public static boolean password(String password) {
        return password.matches("^.{6,}$");
    }

    public static boolean postalCode(String postalCode) {
        return postalCode.matches("^\\d{4} ?[a-zA-Z]{2}$");
    }

    public static boolean phoneNumber(String phoneNumber) {
        return phoneNumber.matches("^0\\d{9}$");
    }

}
