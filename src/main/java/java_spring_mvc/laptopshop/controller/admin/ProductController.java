package java_spring_mvc.laptopshop.controller.admin;

import jakarta.validation.Valid;
import java_spring_mvc.laptopshop.domain.Product;
import java_spring_mvc.laptopshop.domain.User;
import java_spring_mvc.laptopshop.service.ProductService;
import java_spring_mvc.laptopshop.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/product/index";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model, @ModelAttribute("newProduct") @Valid Product product, BindingResult newProductBindingResult, @RequestParam("avatarNameFile") MultipartFile file) {
        if(newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String image = this.uploadService.handleSaveUploadFile(file, "product");

        product.setImage(image);

        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(@PathVariable long id, Model model) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(@PathVariable long id,Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("newProduct", product);
        model.addAttribute("product", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model, @ModelAttribute("newProduct") @Valid Product product, BindingResult newProductBindingResult, @RequestParam("avatarNameFile") MultipartFile file) {
        if(newProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }

        Product productUpdate = this.productService.getProductById(product.getId());

        if(productUpdate != null) {
            productUpdate.setName(product.getName());
            productUpdate.setPrice(product.getPrice());
            productUpdate.setDetailDesc(product.getDetailDesc());
            productUpdate.setShortDesc(product.getShortDesc());
            productUpdate.setQuantity(product.getQuantity());

            if(!file.isEmpty()) {
                String image = this.uploadService.handleSaveUploadFile(file, "product");
                productUpdate.setImage(image);
            }

            productService.handleSaveProduct(productUpdate);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(@PathVariable long id, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product product) {
        productService.handleDeleteProduct(product.getId());
        return "redirect:/admin/product";
    }

}
