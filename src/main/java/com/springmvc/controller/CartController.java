package com.springmvc.controller;

import com.springmvc.model.Cart;
import com.springmvc.model.Product;
import com.springmvc.service.ProductService;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

    @Autowired
    private ProductService productService;

    private final String pageTitle = "Shopping cart";

    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public ModelAndView productAddToCart(HttpServletRequest request, @PathVariable int id) throws IOException {

        HttpSession session = request.getSession();
        Cart cart = new Cart();
        List<Product> productList = new LinkedList<Product>();

        if (session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");

            Product prdct = productService.getProduct(id);

            productList = cart.getProductList();
            productList.add(prdct);
            cart.setProductList(productList);

        } else {

            Product prdct = productService.getProduct(id);
            productList.add(prdct);
            cart.setProductList(productList);

        }
        session.setAttribute("cart", cart);

        ModelAndView productAddCartView = new ModelAndView("shoppingCart");
        productAddCartView.addObject("paginaTitel", pageTitle);
        productAddCartView.addObject("cart", cart);

        return productAddCartView;

    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public ModelAndView productRemoveFromCart(HttpServletRequest request, @PathVariable int id) throws IOException {
        HttpSession session = request.getSession();

        Cart cart = new Cart();
        List<Product> productList = new LinkedList<Product>();

        if (session.getAttribute("cart") != null) {
            cart = (Cart) session.getAttribute("cart");

            productList = cart.getProductList();

            for (int i = 0; i < productList.size(); i++) {

                if (productList.get(i).getId() == id) {

                    productList.remove(productList.get(i));
                }
            }
            cart.setProductList(productList);

        }
        
         ModelAndView removeProductFromCartView = new ModelAndView("shoppingCart");
        removeProductFromCartView.addObject("paginaTitel", pageTitle);
        removeProductFromCartView.addObject("cart", cart);
        return removeProductFromCartView;
    }
}
