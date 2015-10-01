package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Product;

public interface ProductRepository extends CrudRepository<Product, Integer> {
}
