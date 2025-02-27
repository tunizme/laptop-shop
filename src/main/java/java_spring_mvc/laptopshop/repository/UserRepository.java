package java_spring_mvc.laptopshop.repository;

import java_spring_mvc.laptopshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);
    void deleteById(Long id);
    List<User> findAll();
    List<User> findByEmail(String email);
    User findById(long id);
    boolean existsByEmail(String email);
    User findUserByEmail(String email);
}
