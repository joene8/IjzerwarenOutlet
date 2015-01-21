package com.springmvc.controller;

import com.springmvc.model.Item;
import com.springmvc.model.ItemOrder;
import com.springmvc.model.TimeLog;
import com.springmvc.model.User;
import com.springmvc.model.Validation;
import com.springmvc.service.EstablishmentService;
import com.springmvc.service.ItemOrderService;
import com.springmvc.service.TimeLogService;
import com.springmvc.service.UserService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

    @Autowired
    private EstablishmentService establishmentService;

    TimeLog t = new TimeLog();

    // ADD STEP 1 LOAD
    @RequestMapping(value = "/add_step_1", method = RequestMethod.GET)
    public String loadAdd(Model model, HttpServletRequest request) throws IOException {
        if (request.getSession().getAttribute("currentUser") != null) {
            model.addAttribute("pageTitle", "Check user information");
            model.addAttribute("pageDescription", "check your information");
        } else {
            model.addAttribute("pageTitle", "Guest information");
            model.addAttribute("pageDescription", "Enter the required information.");
        }

        model.addAttribute("user", new User());
        return "order_add_step_1";
    }

    // ADD STEP 1 SUBMIT
    @RequestMapping(value = "/add_step_1", method = RequestMethod.POST)
    public String submitAdd(Model model, User user, HttpServletRequest request) throws IOException {
//        // VALIDATION START
//        model = validate(model, user);
//        if (model.containsAttribute("anyErrors")) {
//            model.addAttribute("pageTitle", "Guest information");
//            model.addAttribute("pageDescription", "Enter the required information.");
//            user.setPassword("");
//            model.addAttribute("message", "Not all fields were entered correctly.");
//            model.addAttribute("type", "danger");
//            return "order_add_step_1";
//        }
//        // VALIDATION END
        if (userService.getUser(user.getId()) == null) {
            model.addAttribute("pageTitle", "Delivery method");
            model.addAttribute("pageDescription", "Choose where the items should be delivered.");
            model.addAttribute("message", "User was successfully created.");
            model.addAttribute("type", "success");
            model.addAttribute("establishments", establishmentService.getEstablishments());
            model.addAttribute("itemOrder", new ItemOrder());
            return "order_add_step_2";
        }
//        userService.addUser(user);  
        request.getSession().setAttribute("currentUser", user);
        model.addAttribute("pageTitle", "Delivery method");
        model.addAttribute("message", "Welcome " + user.getFirstName() + " " + user.getLastName());
        model.addAttribute("pageDescription", "Choose where the items should be delivered.");
        model.addAttribute("type", "success");
        model.addAttribute("establishments", establishmentService.getEstablishments());
        model.addAttribute("itemOrder", new ItemOrder());
        //REGISTER LOGIN
        timeLogService.addTimeLog(t);
        timeLogService.updateLogin(t, user);

        return "order_add_step_2";
    }

    // ADD STEP 2 SUBMIT
    @RequestMapping(value = "/add_step_2", method = RequestMethod.POST)
    public String submitAddStep2(ItemOrder itemOrder, Model model, HttpServletRequest request) throws IOException {

//        // VALIDATION START
//        model = validateStep2(model, itemOrder);
//        if (model.containsAttribute("anyErrors")) {
//            model.addAttribute("pageTitle", "Add product");
//            model.addAttribute("pageDescription", "Enter all the information for this product.");
//            model.addAttribute("message", "Not all fields were entered correctly.");
//            model.addAttribute("type", "danger");
//            return "order_add_step_2";
//        }
        float shippingCosts = 0;
//        if(((Float) request.getSession().getAttribute("${cart.getTotalPrice()}"))>300.0){
//            shippingCosts = (float) 40.0;
//        }    
//        
        itemOrder.setUser((User) request.getSession().getAttribute("currentUser"));
        itemOrder.setDate(new Date(request.getSession().getLastAccessedTime()));
////        if ((Boolean) request.getSession().getAttribute("delivery") == true) {
////            itemOrder.setDelivery(true);
////        } else {
////            itemOrder.setDelivery(false);
////        }
//        
////        itemOrder.setDestination((String) request.getSession().getAttribute("Destination"));
        itemOrder.setItem((Item) request.getSession().getAttribute("currentItem"));
//        itemOrder.setShippingCosts(shippingCosts);
//        itemOrder.setTotalPrice((Float) request.getSession().getAttribute("${cart.getTotalPrice()}"));
//        itemOrder.setAmount(0);

        itemOrderService.addItemOrder(itemOrder);
        model.addAttribute("pageTitle", "Confirmation");
        model.addAttribute("pageDescription", "Check the information.");
        model.addAttribute("message", "something was ordered successfully.");
        model.addAttribute("type", "success");
        return "order_add_step_3";
    }

    // ADD STEP 3 LOAD
    @RequestMapping(value = "/add_step_3", method = RequestMethod.GET)
    public String LoadAddStep3(Model model, ItemOrder itemOrder) throws IOException {

        return "order_add_step_3";
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

    // HISTORY
    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String history(Model model, HttpServletRequest request) throws IOException {

        List<ItemOrder> itemOrders = itemOrderService.getItemOrders();
        List<ItemOrder> foundItemOrder = new ArrayList<ItemOrder>();
        for (ItemOrder i : itemOrders) {
            if (i.getUser().getId() == ((User) request.getSession().getAttribute("currentUser")).getId()) {
                foundItemOrder.add(i);
            }
        }

        model.addAttribute("pageTitle", "Order History");
        model.addAttribute("pageDescription", "View your order history.");
        model.addAttribute("itemOrders", foundItemOrder);

        return "itemOrder_history";
    }

    // LIST
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) throws IOException {

        model.addAttribute("pageTitle", "Order List");
        model.addAttribute("pageDescription", "Order List");
        model.addAttribute("itemOrders", itemOrderService.getItemOrders());

        return "itemOrder_list";
    }

    // VIEW
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public String view(Model model, @PathVariable int id, HttpServletRequest request) throws IOException {

        model.addAttribute("pageTitle", "View Order");
        model.addAttribute("pageDescription", "View your order.");
        model.addAttribute("itemOrder", (itemOrderService.getItemOrder(id)));

        return "itemOrder_view";
    }

    // READY
    @RequestMapping(value = "/ready/{id}", method = RequestMethod.GET)
    public String ready(Model model, @PathVariable int id, HttpServletRequest request) throws IOException {

        ItemOrder itemOrder = itemOrderService.getItemOrder(id);
        itemOrder.setReady(true);
        itemOrderService.updateItemOrder(itemOrder);

        model.addAttribute("message", "Order has been set to ready.");
        model.addAttribute("pageTitle", "Order List");
        model.addAttribute("pageDescription", "Order List");
        model.addAttribute("message", "Order has been set to ready.");
        model.addAttribute("type", "success");
        model.addAttribute("itemOrders", itemOrderService.getItemOrders());

        return "itemOrder_list";
    }
    
    // UNREADY
    @RequestMapping(value = "/unready/{id}", method = RequestMethod.GET)
    public String unready(Model model, @PathVariable int id, HttpServletRequest request) throws IOException {

        ItemOrder itemOrder = itemOrderService.getItemOrder(id);
        itemOrder.setReady(false);
        itemOrderService.updateItemOrder(itemOrder);

        model.addAttribute("message", "Order has been set to unready.");
        model.addAttribute("pageTitle", "Order List");
        model.addAttribute("pageDescription", "Order List");
        model.addAttribute("message", "Order has been set to ready.");
        model.addAttribute("type", "success");
        model.addAttribute("itemOrders", itemOrderService.getItemOrders());

        return "itemOrder_list";
    }
}
