package com.springmvc.controller;

import com.springmvc.model.Establishment;
import com.springmvc.model.Validation;
import com.springmvc.service.EstablishmentService;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author jaron
 */
@Controller
@RequestMapping(value = "/establishment")
public class EstablishmentController {

    @Autowired
    private EstablishmentService establishmentService;
    
    // LIST
     @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) throws IOException {
        model.addAttribute("pageTitle", "Establishments");
        model.addAttribute("establishments", establishmentService.getEstablishments());
        return "establishment_list";
    }

    // ADD LOAD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String loadAdd(Model model) throws IOException {
        model.addAttribute("pageTitle", "Add establishment");
        model.addAttribute("establishment", new Establishment());
        return "establishment_add";
    }

    // ADD SUBMIT
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String submitAdd(Model model, Establishment establishment, HttpServletRequest request) throws IOException {
        // VALIDATION START
        boolean anyErrors = false;
        if (!Validation.lettersMin(establishment.getName(), 2)) {
            model.addAttribute("errorFirstName", true);
            anyErrors = true;
        }
        if (!Validation.lettersMin(establishment.getStreetName(), 2)) {
            model.addAttribute("errorStreetName", true);
            anyErrors = true;
        }
        if (!Validation.numbersMin(Integer.toString(establishment.getStreetNumber()), 1)) {
            model.addAttribute("errorStreetNumber", true);
            anyErrors = true;
        }

        if (!Validation.postalCode(establishment.getPostalCode())) {
            model.addAttribute("errorPostalCode", true);
            anyErrors = true;
        }
        if (!Validation.lettersMin(establishment.getCity(), 2)) {
            model.addAttribute("errorCity", true);
            anyErrors = true;
        }
        if (!Validation.phoneNumber("0" + Integer.toString(establishment.getPhoneNumber()))) {
            model.addAttribute("errorPhoneNumber", true);
            anyErrors = true;
        }
        if (anyErrors) {
            model.addAttribute("pageTitle", "Add establishment");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            return "establishment_add";
        }
        // VALIDATION END
        establishmentService.addEstablishment(establishment);
        request.getSession().setAttribute("currentUser", establishment);
        model.addAttribute("pageTitle", "Establishments");
        model.addAttribute("message", establishment.getName()+" was succesfully added." );
        model.addAttribute("type", "success");
        return "establishment_list";
    }
}
