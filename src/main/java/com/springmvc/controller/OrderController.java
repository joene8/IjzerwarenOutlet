package com.springmvc.controller;


import com.springmvc.model.Order;
import com.springmvc.service.OrderService;
import java.io.IOException;
import java.util.ArrayList;
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
@RequestMapping(value = "/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    // HISTORY
    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String history(Model model) throws IOException {
        model.addAttribute("pageTitle", "Order History");
        model.addAttribute("pageDescription", "View or delete your orders.");
//        model.addAttribute("orders", orderService.getOrders());
        model.addAttribute("orders", new ArrayList<Order>());
        return "order_history";
    }
}