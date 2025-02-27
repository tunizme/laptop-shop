package java_spring_mvc.laptopshop.controller.client;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java_spring_mvc.laptopshop.domain.Cart;
import java_spring_mvc.laptopshop.domain.CartDetail;
import java_spring_mvc.laptopshop.domain.Product;
import java_spring_mvc.laptopshop.domain.User;
import java_spring_mvc.laptopshop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ItemController {

    private final ProductService productService;


    ItemController(ProductService productService) {
        this.productService = productService;
    }


    @GetMapping("/product/{id}")
    public String getItemDetailPage(@PathVariable long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest req, HttpSession session) {
        HttpSession httpSession = req.getSession();
        String email = (String) httpSession.getAttribute("email");

        this.productService.HandleAddToCart(email, id, session);

        return "redirect:/product/" + id;
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest req) {
        User currentUser = new User();
        HttpSession httpSession = req.getSession(false);
        long id = (long) httpSession.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.getCartByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/index";
    }

}
