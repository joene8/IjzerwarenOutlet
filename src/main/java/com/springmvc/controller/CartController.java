package com.springmvc.controller;

import com.springmvc.model.Cart;
import com.springmvc.model.Item;
import com.springmvc.service.ItemService;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

    @Autowired
    private ItemService itemService;

    private final String pageTitle = "Shopping cart";

    
    @RequestMapping(value = "/shopping_cart")
    public String cart(Model model, HttpServletRequest request) throws IOException {
        model.addAttribute("pageTitle", pageTitle);
        
        return "shopping_cart";
    }
    
    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public String submitAdd(@PathVariable int id, Model model, HttpServletRequest request ) {

        HttpSession session = request.getSession();
        Cart cart = new Cart();
        List<Item> itemList = new LinkedList<Item>();

        if (session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");

            Item itm = itemService.getItem(id);

            itemList = cart.getItemList();
            itemList.add(itm);
            cart.setItemList(itemList);

        } else {

            Item itm = itemService.getItem(id);
            itemList.add(itm);
            cart.setItemList(itemList);

        }
        session.setAttribute("cart", cart);
        
        model.addAttribute("pageTitle", pageTitle);
        model.addAttribute("cart", cart);

        return "shopping_cart";

    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String itemRemoveFromCart(Model model, HttpServletRequest request, @PathVariable int id) throws IOException {
        HttpSession session = request.getSession();

        Cart cart = new Cart();
        List<Item> itemList = new LinkedList<Item>();;

        if (session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");

            itemList = cart.getItemList();

            for (int i = 0; i < itemList.size(); i++) {

                if (itemList.get(i).getId() == id) {

                    itemList.remove(itemList.get(i));
                }
            }
            cart.setItemList(itemList);

        }
        
        model.addAttribute("pageTitle", pageTitle);
        model.addAttribute("cart", cart);
        
        return "shopping_cart";
    }
}
