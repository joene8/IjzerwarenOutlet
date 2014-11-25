package com.springmvc.controller;

import com.springmvc.model.Product;
import com.springmvc.service.ProductService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    // LIST
    @RequestMapping(value = "/list")
    public String list(Model model) throws IOException {
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("products", productService.getProducts());
        return "product_list";
    }

    // ADD LOAD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String loadAdd(Model model) throws IOException {
        model.addAttribute("pageTitle", "Add product");
        model.addAttribute("product", new Product());
        return "product_add";
    }

    // ADD SUMBIT
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String productAdd(Model model, @Valid Product product) throws IOException {
        productService.addProduct(product);
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("message", "Product \"" + product.getName() + "\" was added succesfully.");
        model.addAttribute("type", "success");
        return "product_list";
    }

    // SEARCH
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "search") String search, Model model) throws IOException {
        List<Product> products = productService.getProducts();
        List<Product> foundProducts = new ArrayList<Product>();
        for (Product p : products) {
            if (p.getName().toLowerCase().contains(search.toLowerCase())) {
                foundProducts.add(p);
            }
        }
        model.addAttribute("products", foundProducts);
        String message = "";
        if (foundProducts.isEmpty()) {
            message = "No products with \"" + search + "\" were found";
            model.addAttribute("type", "warning");
        } else {
            String extraS = "";
            if (foundProducts.size() == 1) {
                extraS = "s";
            }
            message = foundProducts.size() + " product" + extraS + " with \"" + search + "\" were found.";
            model.addAttribute("type", "success");

        }
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("message", message);
        return "product_list";
    }

    
    // EDIT LOAD
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editLoad(@PathVariable int id, Model model) {
        model.addAttribute("pageTitle", "Edit product");
        model.addAttribute("product", productService.getProduct(id));
        return "product_edit";
    }

    
    // EDIT SUBMIT
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editSubmit(@ModelAttribute("product") Product product, Model model) {
        productService.updateProduct(product);
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("message", product.getName() + " was succesfully edited.");
        model.addAttribute("type", "success");
        return "product_list";
    }

    
    // REMOVE
    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable int id, Model model) {
        Product product = productService.getProduct(id);
        productService.deleteProduct(id);
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("message", product.getName() + " was succesfully deleted.");
        model.addAttribute("type", "success");
        return "product_list";
    }
}
