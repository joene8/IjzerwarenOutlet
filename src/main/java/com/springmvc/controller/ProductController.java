package com.springmvc.controller;

import com.springmvc.model.Establishment;
import com.springmvc.model.Item;
import com.springmvc.model.Product;
import com.springmvc.model.StihoArtikel;
import com.springmvc.model.Validation;
import com.springmvc.service.EstablishmentService;
import com.springmvc.service.ItemService;
import com.springmvc.service.ProductService;
import com.springmvc.service.StihoArtikelService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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

    @Autowired
    private StihoArtikelService stihoArtikelService;

    @Autowired
    private EstablishmentService establishmentService;

    @Autowired
    private ItemService itemService;

      // LIST THUMBNAILS
    @RequestMapping(value = "/list")
    public String list(Model model, HttpServletRequest request) throws IOException {
        model.addAttribute("pageTitle", "Products");
        model.addAttribute("pageDescription", "Browse through all of our poducts here.");
        model.addAttribute("establishments", establishmentService.getEstablishments());
        Object currentEstablishment = request.getSession().getAttribute("currentEstablishment");
        if (currentEstablishment != null) {
            String es = (String) currentEstablishment;
            int establishmentId = Integer.parseInt(es);
            List<Item> itemList = itemService.getItems();
            List<Item> list = new ArrayList<Item>();
            for (Item i : itemList) {
                if (establishmentId == i.getEstablishment().getId()) {
                    list.add(i);
                }
            }
            model.addAttribute("items", list);
        }

        return "product_list";
    }   
 //LIST ESTABLISHMENT PRODUCTS
    @RequestMapping(value = "/establishment_products", method = RequestMethod.POST)
    public String establishmentProducts(Model model, @RequestParam(value = "choice") String choice, HttpServletRequest request) throws IOException {
        model.addAttribute("pageTitle", "Products");
        Establishment establishmentName = establishmentService.getEstablishment(Integer.parseInt(choice));
        model.addAttribute("pageDescription", "These are all the products from " + establishmentName.getName() + " .");
        model.addAttribute("products", productService.getProducts());
        model.addAttribute("establishments", establishmentService.getEstablishments());
        request.getSession().setAttribute("currentEstablishment", choice);
        Object currentEstablishment = request.getSession().getAttribute("currentEstablishment");
        if (currentEstablishment != null) {
            String es = (String) currentEstablishment;
            int establishmentId = Integer.parseInt(es);
            List<Item> itemList = itemService.getItems();
            List<Item> list = new ArrayList<Item>();
            for (Item i : itemList) {
                if (establishmentId == i.getEstablishment().getId()) {
                    list.add(i);
                }
            }
            model.addAttribute("items", list);
        }
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
    public String submitAddStep1(@RequestParam(value = "itemNumber") String itemNumber, Model model, HttpServletRequest request) throws IOException {
        model.addAttribute("pageTitle", "Add product");
        int number = Integer.parseInt(itemNumber);
        StihoArtikel sa = stihoArtikelService.getStihoArtikel(number);
        if (sa == null) {
            model.addAttribute("pageDescription", "Enter the item number of the product you would like to add.");
            model.addAttribute("message", "No product with item number: " + itemNumber + " was found in the STIHO database.");
            model.addAttribute("type", "danger");
            return "product_add_step_1";
        }
        request.getSession().setAttribute("sessionStihoArtikel", sa);
        Product p = new Product();
        List<Product> products = productService.getProducts();
        for (Product product : products) {
            if (product.getProductNumber().getArtikelnummer() == number) {
                model.addAttribute("pageDescription", "Enter all the information for this product.");
                request.getSession().setAttribute("sessionProduct", product);
                Item item = new Item();
                model.addAttribute("item", item);
                return "product_add_step_3";
            }
        }
        if (p.getId() == 0) {
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
    public String submitAddStep2(Product product, Model model, HttpServletRequest request) throws IOException {
        model.addAttribute("pageTitle", "Add product");
        model.addAttribute("pageDescription", "Enter all the information for this product.");
        // VALIDATION START
        model = validateStep2(model, product);
        if (model.containsAttribute("anyErrors")) {
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            return "product_add_step_2";
        }
        request.getSession().setAttribute("sessionProduct", product);
        Item item = new Item();
        model.addAttribute("item", item);
        product.setProductNumber((StihoArtikel) request.getSession().getAttribute("sessionStihoArtikel"));
        productService.addProduct(product);
        return "product_add_step_3";
    }

    // ADD STEP 3 SUBMIT
    @RequestMapping(value = "/add_step_3", method = RequestMethod.POST)
    public String submitAddStep3(Item item, Model model, HttpServletRequest request) throws IOException {

        // VALIDATION START
        model = validateStep3(model, item);
        if (model.containsAttribute("anyErrors")) {
            model.addAttribute("pageTitle", "Add product");
            model.addAttribute("pageDescription", "Enter all the information for this product.");
            model.addAttribute("message", "Not all fields were entered correctly.");
            model.addAttribute("type", "danger");
            return "product_add_step_3";
        }
        item.setProduct((Product) request.getSession().getAttribute("sessionProduct"));
//        User currentUser = (User)request.getSession().getAttribute("currentUser");
//        item.setEstablishment(currentUser.getEstablishment());
        itemService.addItem(item);
        model.addAttribute("pageTitle", "Home");
        model.addAttribute("pageDescription", "Welcome to our site, go to products to start browsing.");
        model.addAttribute("message", item.getProduct().getName() + " was added successfully.");
        model.addAttribute("type", "success");
        return "product_list";
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
    public String productInfo(@PathVariable int id, Model model, Item item) throws IOException{
        
        model.addAttribute("paginaTitel", "The item you are currently viewing is: " + itemService.getItem(id).getProduct().getName());
        model.addAttribute("product", itemService.getItem(id).getProduct().getName());

        return "product_info";
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

    // VALIDATE PRODUCT STEP 2
    public Model validateStep2(Model model, Product product) {
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

    // VALIDATE ITEM STEP 3
    public Model validateStep3(Model model, Item item) {
        boolean anyErrors = false;
        if (!Validation.price(item.getChosenPrice() + "")) {
            model.addAttribute("chosenPriceError", true);
            anyErrors = true;
        }
        if (!Validation.numbersMin(item.getStock() + "", 1)) {
            model.addAttribute("stockError", true);
            anyErrors = true;
        }

        if (item.isAddition()) {
            if (!Validation.allMin(item.getAdditionDescription(), 6)) {
                model.addAttribute("additionDescriptionError", true);
                anyErrors = true;
            }
        }
        if (anyErrors) {
            model.addAttribute("anyErrors", anyErrors);
        }
        return model;
    }
}
