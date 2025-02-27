package java_spring_mvc.laptopshop.repository;

import java_spring_mvc.laptopshop.domain.Cart;
import java_spring_mvc.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);
}
