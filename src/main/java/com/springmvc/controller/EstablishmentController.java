package com.springmvc.controller;

import com.springmvc.model.Establishment;
import com.springmvc.model.Validation;
import com.springmvc.service.EstablishmentService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
        model.addAttribute("pageDescription", "Add, edit or view all our Establishments.");
        model.addAttribute("establishments", establishmentService.getEstablishments());
        return "establishment_list";
    }

    // ADD LOAD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String loadAdd(Model model) throws IOException {
        model.addAttribute("pageTitle", "Add establishment");
        model.addAttribute("pageDescription", "Enter the information for the new establishment.");
        model.addAttribute("establishment", new Establishment());
        model.addAttribute("addEditOrView", "add");
        return "establishment_add_edit_view";
    }

    // ADD SUBMIT
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String submitAdd(Model model, Establishment establishment) throws IOException {
        // VALIDATION START
        model = validate(model, establishment);
        if (model.containsAttribute("anyErrors")) {
            model.addAttribute("pageTitle", "Add establishment");
            model.addAttribute("pageDescription", "Enter the information for the new establishment.");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            model.addAttribute("addEditOrView", "add");
            return "establishment_add_edit_view";
        }
        // VALIDATION END
        establishmentService.addEstablishment(establishment);
        model.addAttribute("pageTitle", "Establishments");
        model.addAttribute("pageDescription", "Add, edit or view all our Establishments.");
        model.addAttribute("message", establishment.getName() + " was succesfully added.");
        model.addAttribute("type", "success");
        model.addAttribute("establishments", establishmentService.getEstablishments());
        return "establishment_list";
    }

    // EDIT LOAD
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String loadEdit(Model model, @PathVariable int id) throws IOException {
        model.addAttribute("pageTitle", "Edit establishment");
        model.addAttribute("pageDescription", "Update the information for this establishment.");
        model.addAttribute("establishment", establishmentService.getEstablishment(id));
        model.addAttribute("addEditOrView", "edit");
        return "establishment_add_edit_view";
    }

    // EDIT SUBMIT
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String submitEdit(Model model, Establishment establishment) throws IOException {
        // VALIDATION START
        model = validate(model, establishment);
        if (model.containsAttribute("anyErrors")) {
            model.addAttribute("pageTitle", "Edit establishment");
            model.addAttribute("pageDescription", "Update the information for this establishment.");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            model.addAttribute("addEditOrView", "edit");
            return "establishment_add_edit_view";
        }
        // VALIDATION END
        establishmentService.updateEstablishment(establishment);
        model.addAttribute("pageTitle", "Establishments");
        model.addAttribute("pageDescription", "Add, edit or view all our Establishments.");
        model.addAttribute("message", "Information was successfully updated.");
        model.addAttribute("type", "success");
        model.addAttribute("addEditOrView", "view");
        return "establishment_add_edit_view";
    }

    // VIEW
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable int id) throws IOException {
        model.addAttribute("pageTitle", "View establishment");
        model.addAttribute("pageDescription", "All the information for this establishment.");
        model.addAttribute("establishment", establishmentService.getEstablishment(id));
        model.addAttribute("addEditOrView", "view");
        return "establishment_add_edit_view";
    }

    // DELETE
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable int id, Model model) {
        Establishment establishment = establishmentService.getEstablishment(id);
        establishmentService.deleteEstablishment(id);
        model.addAttribute("message", establishment.getName() + " was succesfully deleted.");
        model.addAttribute("type", "success");
        model.addAttribute("pageTitle", "Establishments");
        model.addAttribute("pageDescription", "Add, edit or view all our Establishments.");
        model.addAttribute("establishments", establishmentService.getEstablishments());
        return "establishment_list";
    }

    // VALIDATE ESTABLISHMENT
    public Model validate(Model model, Establishment establishment) {
        boolean anyErrors = false;
        if (!Validation.lettersMin(establishment.getName(), 2)) {
            model.addAttribute("errorFirstName", true);
            anyErrors = true;
        }
        if (!Validation.streetAndCity(establishment.getStreetName())) {
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
        if (!Validation.streetAndCity(establishment.getCity())) {
            model.addAttribute("errorCity", true);
            anyErrors = true;
        }
        if (!Validation.phoneNumber("0" + Integer.toString(establishment.getPhoneNumber()))) {
            model.addAttribute("errorPhoneNumber", true);
            anyErrors = true;
        }
        if (anyErrors) {
            model.addAttribute("anyErrors", anyErrors);
        }
        return model;
    }
}
