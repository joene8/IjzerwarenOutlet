package com.springmvc.controller;

import com.springmvc.model.JsonMaker;
import com.springmvc.model.StihoArtikel;
import com.springmvc.service.StihoArtikelService;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/stiho_artikel")
public class StihoArtikelController {

        @Autowired
    private StihoArtikelService stihoArtikelService;

  
    // JSON
    @RequestMapping(value = "/json")
    public void json(Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
        List<StihoArtikel> list = stihoArtikelService.getStihoArtikels();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(JsonMaker.stihoArtikel(list));
    }
    
        // ADD STEP 1 SUBMIT
    @RequestMapping(value = "/add_step_1", method = RequestMethod.POST)
    public String submitAddStep1(@RequestParam(value = "itemNumber") String itemNumber, Model model) throws IOException {
        model.addAttribute("pageTitle", "Add product");
        model.addAttribute("pageDescription", "Enter the item number of the product you would like to add.");
        List<StihoArtikel> list = stihoArtikelService.getStihoArtikels();
        StihoArtikel sa = new StihoArtikel();
        for (StihoArtikel s : list) {
            if(s.getArtikelnummer()==1){
                sa=s;
            }
        }
        model.addAttribute("message", "No product with item number: " + itemNumber + " was found in the STIHO database."+sa.getCategorie()+"dfdfdf");
        model.addAttribute("type", "danger");
        return "product_add_step_1";
    }
}
