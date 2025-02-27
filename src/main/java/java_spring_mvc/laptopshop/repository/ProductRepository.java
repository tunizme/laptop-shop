package java_spring_mvc.laptopshop.repository;

import java_spring_mvc.laptopshop.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product save(Product product);
    void deleteById(Long id);
    List<Product> findAll();
    Product findById(long id);
}
