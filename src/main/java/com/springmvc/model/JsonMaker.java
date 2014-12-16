/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.springmvc.model;

import java.util.List;

/**
 *
 * @author Deva
 */
public class JsonMaker {
    public static String stihoArtikel(List<StihoArtikel> list){
        String s = "[";
        for (StihoArtikel sa : list) {
            s+="{\"artikelNummer\":\""+sa.getArtikelnummer()+"\", \"categorie\":\""+sa.getCategorie()+"\"},";
        }
        s = s.substring(0, s.length()-1);
        s+="]";
        return s;
    }
}
