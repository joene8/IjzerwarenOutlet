package com.springmvc.controller;


import com.springmvc.service.OrderService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author gebak_000
 */

@Controller
@RequestMapping(value = "/Order")
public class OrderController {

    @Autowired
    private OrderService OrderService;

    @RequestMapping(value = "/list")
    public ModelAndView OrderList() throws IOException {

        ModelAndView OrderListView = new ModelAndView("OrderList");
        OrderListView.addObject("Orders", OrderService.getOrders());

        return OrderListView;
    }
}
