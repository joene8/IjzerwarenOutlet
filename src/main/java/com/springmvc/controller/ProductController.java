package com.springmvc.controller;

import com.springmvc.model.Product;
import com.springmvc.model.StihoArtikel;
import com.springmvc.model.User;
import com.springmvc.model.Validation;
import com.springmvc.service.ProductService;
import com.springmvc.service.StihoArtikelService;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private StihoArtikelService stihoArtikelService;

    // LIST THUMBNAILS
    @RequestMapping(value = "/list")
    public String list(Model model) throws IOException {
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("pageDescription", "Browse through all of our poducts here.");
        model.addAttribute("products", productService.getProducts());
        return "product_list";
    }

    // LIST TABLE
    @RequestMapping(value = "/table")
    public String listTable(Model model) throws IOException {
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("pageDescription", "Add, edit, delete or view a product.");
        model.addAttribute("products", productService.getProducts());
        return "product_list_table";
    }

    // ADD STEP 1 LOAD
    @RequestMapping(value = "/add_step_1", method = RequestMethod.GET)
    public String loadAddStep1(Model model) throws IOException {
        model.addAttribute("pageTitle", "Add product");
        model.addAttribute("pageDescription", "Enter the item number of the product you would like to add.");
        return "product_add_step_1";
    }

    // ADD STEP 1 SUBMIT
    @RequestMapping(value = "/add_step_1", method = RequestMethod.POST)
    public String submitAddStep1(@RequestParam(value = "itemNumber") String itemNumber, Model model) throws IOException {
        model.addAttribute("pageTitle", "Add product");
        int number = Integer.parseInt(itemNumber);
        StihoArtikel sa = stihoArtikelService.getStihoArtikel(number);
        if (sa == null) {
            model.addAttribute("pageDescription", "Enter the item number of the product you would like to add.");
            model.addAttribute("message", "No product with item number: " + itemNumber + " was found in the STIHO database.");
            model.addAttribute("type", "danger");
            return "product_add_step_1";
        }
        Product p = new Product();
        List<Product> products = productService.getProducts();
        for (Product product : products) {
            if (product.getProductNumber().getArtikelnummer() == number) {
                p = product;
                model.addAttribute("existingProduct", true);
                break;
            }
        }
        if (p.getId()==0) {
            p.setProductNumber(sa);
            p.setNetWidth(sa.getNettoBreedte());
            p.setProductLength(sa.getArtikelLengte());
            p.setNetThickness(sa.getNettoDikte());
            p.setGrossWeight(sa.getBrutoGewicht());
            p.setStandardSalePrice(sa.getStandaardVerkoopprijs());
        }
        model.addAttribute("pageDescription", "Enter all the information for this product.");
        model.addAttribute("product", p);
        return "product_add_step_2";
    }
    
    // ADD STEP 2 SUBMIT
    @RequestMapping(value = "/add_step_2", method = RequestMethod.POST)
    public String submitAddStep2(Product product, Model model) throws IOException {
        model.addAttribute("pageTitle", "Add product");
                // VALIDATION START
        model = validate(model, product);
        if (model.containsAttribute("anyErrors")) {
            model.addAttribute("pageDescription", "Enter all the information for this product.");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            return "product_add_step_2";
        }
        return "product_add_step_3";
    }

    // ADD LOAD
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String loadAdd(Model model) throws IOException {
        model.addAttribute("pageTitle", "Add product");
        model.addAttribute("pageDescription", "Enter the item number of the product you would like to add.");
        model.addAttribute("product", new Product());
        return "product_add";
    }

    // ADD SUMBIT
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String productAdd(Model model, @Valid Product product) throws IOException {
        productService.addProduct(product);
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("pageDescription", "Enter the item number of the product you would like to add.");
        model.addAttribute("message", "Product \"" + product.getName() + "\" was added succesfully.");
        model.addAttribute("type", "success");
        return "product_list";
    }
    
    // PRODUCT INFO LIST
     @RequestMapping(value = "/info/{id}", method = RequestMethod.GET)
    public ModelAndView productInfo(@PathVariable int id) {

        ModelAndView productInfoView = new ModelAndView("productInfo");
        productInfoView.addObject("paginaTitel", "Dit is product A" );
        productInfoView.addObject("product", productService.getProduct(id));

        return productInfoView;
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
        model.addAttribute("pageDescription", "All the products that matched your search criteria.");
        model.addAttribute("message", message);
        return "product_list";
    }

    // EDIT LOAD
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editLoad(@PathVariable int id, Model model) {
        model.addAttribute("pageTitle", "Edit product");
        model.addAttribute("pageDescription", "Update the information for this product.");
        model.addAttribute("product", productService.getProduct(id));
        return "product_edit";
    }

    // EDIT SUBMIT
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editSubmit(@ModelAttribute("product") Product product, Model model) {
        productService.updateProduct(product);
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("pageDescription", "Add, edit, delete or view a product.");
        model.addAttribute("message", product.getName() + " was succesfully edited.");
        model.addAttribute("type", "success");
        return "product_list";
    }  
    
    // DELETE
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable int id, Model model) {
        Product product = productService.getProduct(id);
        productService.deleteProduct(id);
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("pageDescription", "Add, edit, delete or view a product.");
        model.addAttribute("message", product.getName() + " was succesfully deleted.");
        model.addAttribute("type", "success");
        return "product_list";
    }
    // VALIDATE PRODUCT
        public Model validate(Model model, Product product) {
        boolean anyErrors = false;
        if (!Validation.lettersMin(product.getName(), 2)) {
            model.addAttribute("nameError", true);
            anyErrors = true;
        }
        if (!Validation.allMin(product.getDescription(), 6)) {
            model.addAttribute("descriptionError", true);
            anyErrors = true;
        }
                if (anyErrors) {
            model.addAttribute("anyErrors", anyErrors);
        }
        return model;
    }
}
