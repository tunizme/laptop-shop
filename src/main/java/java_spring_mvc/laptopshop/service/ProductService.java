package java_spring_mvc.laptopshop.service;

import jakarta.servlet.http.HttpSession;
import java_spring_mvc.laptopshop.domain.Cart;
import java_spring_mvc.laptopshop.domain.CartDetail;
import java_spring_mvc.laptopshop.domain.Product;
import java_spring_mvc.laptopshop.domain.User;
import java_spring_mvc.laptopshop.repository.CartDetailRepository;
import java_spring_mvc.laptopshop.repository.CartRepository;
import java_spring_mvc.laptopshop.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;


    public ProductService(ProductRepository productRepository, UserService userService, CartRepository cartRepository, CartDetailRepository cartDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product handleSaveProduct(Product product) {
        return productRepository.save(product);
    }

    public void handleDeleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).get();
    }

    public Cart getCartByUser(User user) {
        return cartRepository.findByUser(user);
    }

    public void HandleAddToCart(String email, long id, HttpSession session) {
        User user = userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);

            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = this.cartRepository.save(newCart);
            }

            Product product = this.getProductById(id);
            if (product != null) {

                CartDetail oldCartDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
                if (oldCartDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setProduct(product);
                    cartDetail.setCart(cart);
                    cartDetail.setPrice(product.getPrice());
                    cartDetail.setQuantity(1);
                    this.cartDetailRepository.save(cartDetail);

                    int sum = cart.getSum() + 1;
                    cart.setSum(sum);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", sum);
                } else {
                    oldCartDetail.setQuantity(oldCartDetail.getQuantity() + 1);
                }
            }

        }
    }

}
