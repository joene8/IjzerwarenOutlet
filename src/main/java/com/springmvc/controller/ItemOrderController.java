package com.springmvc.controller;

import com.springmvc.model.Cart;
import com.springmvc.model.Item;
import com.springmvc.model.ItemOrder;
import com.springmvc.model.TimeLog;
import com.springmvc.model.User;
import com.springmvc.model.Validation;
import com.springmvc.service.EstablishmentService;
import com.springmvc.service.ItemOrderService;
import com.springmvc.service.ItemService;
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
    private ItemService itemService;

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
            model.addAttribute("establishments", establishmentService.getEstablishments());
            model.addAttribute("itemOrder", new ItemOrder());
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            List<Item> itemList = cart.getItemList();
            Item currentItem = itemList.get(0);
            model.addAttribute("establishment", currentItem.getEstablishment());
            return "order_add_step_2";
        }
//        userService.addUser(user);  
        request.getSession().setAttribute("currentUser", user);
        model.addAttribute("pageTitle", "Delivery method");
        model.addAttribute("message", "Welcome " + user.getFirstName() + " " + user.getLastName());
        model.addAttribute("pageDescription", "Choose where the items should be delivered.");
        model.addAttribute("type", "success");
        model.addAttribute("establishments", establishmentService.getEstablishments());

        //REGISTER LOGIN
        timeLogService.addTimeLog(t);
        timeLogService.updateLogin(t, user);
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        List<Item> itemList = cart.getItemList();
        Item currentItem = itemList.get(0);
        model.addAttribute("establishment", currentItem.getEstablishment());
        return "order_add_step_2";
    }

    // ADD STEP 2 SUBMIT
    @RequestMapping(value = "/add_step_2", method = RequestMethod.POST)
    public String submitAddStep2(ItemOrder itemOrder, Model model, HttpServletRequest request) throws IOException {

        float shippingCosts = 40;
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        List<Item> itemList = cart.getItemList();
        Item currentItem = itemList.get(0);
        itemOrder.setAmount(currentItem.getStock());
        itemOrder.setItem(currentItem);
        if (currentItem.getBulkPrice() > 300.0 || itemOrder.isDelivery() == false) {
            shippingCosts = 0;
        }
        itemOrder.setDate(new Date(request.getSession().getLastAccessedTime()));
        itemOrder.setShippingCosts(shippingCosts);
        request.getSession().setAttribute("sessionDelivery", itemOrder.isDelivery());

        model.addAttribute("pageTitle", "Confirmation");
        model.addAttribute("pageDescription", "Check the information.");
        model.addAttribute("itemOrder", itemOrder);
        return "order_add_step_3";
    }

    // ADD STEP 3 SUBMIT
    @RequestMapping(value = "/add_step_3", method = RequestMethod.POST)
    public String submitAddStep3(Model model, ItemOrder itemOrder, HttpServletRequest request) throws IOException {
        float shippingCosts = 40;
        itemOrder.setDelivery((Boolean) request.getSession().getAttribute("sessionDelivery"));
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        List<Item> itemList = cart.getItemList();
        Item currentItem = itemList.get(0);
        if (currentItem.getBulkPrice() > 300.0 || itemOrder.isDelivery() == false) {
            shippingCosts = 0;
        }

        itemList.remove(0);
        cart.setItemList(itemList);
        request.getSession().setAttribute("cart", cart);
        itemOrder.setAmount(currentItem.getStock());
        currentItem.setStock(0);
        itemService.updateItem(currentItem);
        itemOrder.setTotalPrice((float) currentItem.getActualPrice());
        itemOrder.setItem(currentItem);
        itemOrder.setShippingCosts(shippingCosts);
        itemOrder.setUser((User) request.getSession().getAttribute("currentUser"));
        itemOrder.setDate(new Date(request.getSession().getLastAccessedTime()));
        itemOrderService.addItemOrder(itemOrder);
        model.addAttribute("message", currentItem.getProduct().getName() + " was ordered successfully.");
        model.addAttribute("type", "success");
        return history(model, request);
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
