package java_spring_mvc.laptopshop.repository;

import java_spring_mvc.laptopshop.domain.Cart;
import java_spring_mvc.laptopshop.domain.CartDetail;
import java_spring_mvc.laptopshop.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);
    CartDetail findByCartAndProduct(Cart cart, Product product);
}
