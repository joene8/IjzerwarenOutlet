package com.springmvc.editor;

import com.springmvc.model.Product;
import com.springmvc.service.ProductService;
import java.beans.PropertyEditorSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ProductEditor extends PropertyEditorSupport {

    @Autowired
    private ProductService productService;

    @Override
    public void setAsText(String text) {
        Product p = this.productService.getProduct(Integer.valueOf(text));
        this.setValue(p);
    }

}
