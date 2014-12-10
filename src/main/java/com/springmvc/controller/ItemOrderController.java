package com.springmvc.controller;


import com.springmvc.model.ItemOrder;
import com.springmvc.service.ItemOrderService;
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
@RequestMapping(value = "/itemOrder")
public class ItemOrderController {

    @Autowired
    private ItemOrderService itemOrderService;

    // HISTORY
    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String history(Model model) throws IOException {
        model.addAttribute("pageTitle", "ItemOrder History");
        model.addAttribute("pageDescription", "View or delete your itemOrders.");
//        model.addAttribute("itemOrders", itemOrderService.getItemOrders());
        model.addAttribute("itemOrders", new ArrayList<ItemOrder>());
        return "itemOrder_history";
    }
}