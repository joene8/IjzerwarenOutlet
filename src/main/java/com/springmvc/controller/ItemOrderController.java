package com.springmvc.controller;


import com.springmvc.service.ItemOrderService;
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
@RequestMapping(value = "/itemOrder")
public class ItemOrderController {

    @Autowired
    private ItemOrderService itemOrderService;

    @RequestMapping(value = "/list")
    public ModelAndView itemOrderList() throws IOException {

        ModelAndView itemOrderListView = new ModelAndView("itemOrderList");
        itemOrderListView.addObject("itemOrders", itemOrderService.getItemOrders());

        return itemOrderListView;
    }
}
