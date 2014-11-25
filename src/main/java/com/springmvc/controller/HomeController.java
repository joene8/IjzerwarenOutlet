package com.springmvc.controller;

import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    // HOME
    @RequestMapping(value = "/")
    public String home(Model model) throws IOException {
        model.addAttribute("pageTitle", "Welcome to our site");
        return "index";
    }

    // HOME
    @RequestMapping(value = "/index")
    public String index(Model model) throws IOException {
        model.addAttribute("pageTitle", "Welcome to our site");
        return "index";
    }

    // ABOUT US
    @RequestMapping(value = "/about_us")
    public String aboutUs(Model model) throws IOException {
        model.addAttribute("pageTitle", "About us");
        model.addAttribute("message", "Sorry, more inormation will be added soon.");
        model.addAttribute("type", "info");
        return "about_us";
    }

    // CONTACT
    @RequestMapping(value = "/contact")
    public String contact(Model model) throws IOException {
        model.addAttribute("pageTitle", "Contact");
        model.addAttribute("message", "Sorry, more inormation will be added soon.");
        model.addAttribute("type", "info");
        return "contact";
    }
}
