package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {
    User findByUsername(String username);
}
