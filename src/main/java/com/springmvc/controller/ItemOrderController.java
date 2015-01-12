package com.springmvc.controller;


import com.springmvc.model.Item;
import com.springmvc.model.ItemOrder;
import com.springmvc.model.TimeLog;
import com.springmvc.model.User;
import com.springmvc.model.Validation;
import com.springmvc.service.ItemOrderService;
import com.springmvc.service.TimeLogService;
import com.springmvc.service.UserService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author gebak_000
 */

@Controller
@RequestMapping(value = "/itemOrder")
public class ItemOrderController {

    @Autowired
    private ItemOrderService itemOrderService;
    
    @Autowired
    private UserService userService;
   
    @Autowired
    private TimeLogService timeLogService;
    
    TimeLog t = new TimeLog();
    // HISTORY
    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String history(Model model) throws IOException {
        model.addAttribute("pageTitle", "ItemOrder History");
        model.addAttribute("pageDescription", "View or delete your itemOrders.");
//        model.addAttribute("itemOrders", itemOrderService.getItemOrders());
        model.addAttribute("itemOrders", new ArrayList<ItemOrder>());
        return "itemOrder_history";
    }
    
    // ADD STEP 1 LOAD
    @RequestMapping(value = "/add_step_1/{id}", method = RequestMethod.GET)
    public String loadAdd(Model model, HttpServletRequest request) throws IOException {
        if (request.getSession().getAttribute("currentUser") != null) {
            model.addAttribute("pageTitle", "Check user information");
            model.addAttribute("pageDescription", "check your information");
        } else {
            model.addAttribute("pageTitle", "Guest information");
            model.addAttribute("pageDescription", "Enter the required information.");
        }

        model.addAttribute("user", new User());
        return "order_add_step_1/{id}";
    }

    // ADD STEP 1 SUBMIT
    @RequestMapping(value = "/add_step_1/{id}", method = RequestMethod.POST)
    public String submitAdd(Model model, User user, HttpServletRequest request) throws IOException {
        // VALIDATION START
        model = validate(model, user);
        if (model.containsAttribute("anyErrors")) {
            if (request.getSession().getAttribute("currentUser") != null) {
                model.addAttribute("pageTitle", "Add user");
                model.addAttribute("pageDescription", "Enter the information for the new user.");
            } else {
                model.addAttribute("pageTitle", "Register");
                model.addAttribute("pageDescription", "Enter your information.");
            }
            user.setPassword("");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            return "order_add_step_1/{id}";
        }
        // VALIDATION END
        if (request.getSession().getAttribute("currentUser") != null) {
            model.addAttribute("pageTitle", "Delivery method");
            model.addAttribute("pageDescription", "Choose where the items should be delivered.");
            model.addAttribute("message", "User was successfully validated.");
            model.addAttribute("type", "success");
            
            model.addAttribute("itemOrder", new ItemOrder());
            return "order_add_step_2/{id}";
        }
        request.getSession().setAttribute("currentUser", user);
        model.addAttribute("pageTitle", "Delivery method");
        model.addAttribute("message", "Welcome " + user.getFirstName() + " " + user.getLastName());
        model.addAttribute("pageDescription", "Choose where the items should be delivered.");
        model.addAttribute("type", "success");
        
        model.addAttribute("itemOrder", new ItemOrder());
        //REGISTER LOGIN
        timeLogService.addTimeLog(t);
        timeLogService.updateLogin(t, user);

        return "order_add_step_2/{id}";
    }
    
    // ADD STEP 2 SUBMIT
    @RequestMapping(value = "/add_step_2/{id}", method = RequestMethod.POST)
    public String submitAddStep2(ItemOrder itemOrder, Model model, HttpServletRequest request) throws IOException {

        // VALIDATION START
        model = validateStep2(model, itemOrder);
        if (model.containsAttribute("anyErrors")) {
            model.addAttribute("pageTitle", "Add product");
            model.addAttribute("pageDescription", "Enter all the information for this product.");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            return "order_add_step_2";
        }
        itemOrder.setUser((User) request.getSession().getAttribute("currentUser"));
        itemOrder.setDate(new Date(request.getSession().getLastAccessedTime()));
        if(request.getSession().getAttribute("delivery")=="true")
            itemOrder.setDelivery(true);
        else
            itemOrder.setDelivery(false);
        itemOrder.setDestination((String) request.getSession().getAttribute("Destination"));
        itemOrder.setItem(null);
        itemOrder.setShippingCosts(0);
        itemOrder.setTotalPrice((Float) request.getSession().getAttribute("${cart.getTotalPrice()}"));
        itemOrder.setAmount((Integer) request.getSession().getAttribute("Stock"));

        
        itemOrderService.addItemOrder(itemOrder);
        model.addAttribute("pageTitle", "Home");
        model.addAttribute("pageDescription", "Welcome to our site, go to products to start browsing.");
        model.addAttribute("message", itemOrder.getItem().getProduct().getName() + " was ordered successfully.");
        model.addAttribute("type", "success");
        return "product_list";
    }
    
    // VALIDATE USER
    public Model validate(Model model, User user) {
        boolean anyErrors = false;
        if (!Validation.lettersMin(user.getFirstName(), 2)) {
            model.addAttribute("errorFirstName", true);
            anyErrors = true;
        }
        if (!Validation.lettersMin(user.getLastName(), 2)) {
            model.addAttribute("errorLastName", true);
            anyErrors = true;
        }
        if (!Validation.email(user.getEmail())) {
            model.addAttribute("errorEmail", true);
            anyErrors = true;
        }
        if (!Validation.streetAndCity(user.getStreetName())) {
            model.addAttribute("errorStreetName", true);
            anyErrors = true;
        }
        if (!Validation.numbersMin(Integer.toString(user.getStreetNumber()), 1)) {
            model.addAttribute("errorStreetNumber", true);
            anyErrors = true;
        }

        if (!Validation.postalCode(user.getPostalCode())) {
            model.addAttribute("errorPostalCode", true);
            anyErrors = true;
        }
        if (!Validation.streetAndCity(user.getCity())) {
            model.addAttribute("errorCity", true);
            anyErrors = true;
        }
        if (!Validation.phoneNumber(user.getPhoneNumber())) {
            model.addAttribute("errorPhoneNumber", true);
            anyErrors = true;
        }
        
        if (anyErrors) {
            model.addAttribute("anyErrors", anyErrors);
        }
        return model;
    }
    
    // VALIDATE ITEM STEP 2
    public Model validateStep2(Model model, ItemOrder itemOrder) {
        boolean anyErrors = false;
        if (!Validation.streetAndCity(itemOrder.getDestination())) {
            model.addAttribute("destionationError", true);
            anyErrors = true;
        }
        
        if (anyErrors) {
            model.addAttribute("anyErrors", anyErrors);
        }
        return model;
    }
}