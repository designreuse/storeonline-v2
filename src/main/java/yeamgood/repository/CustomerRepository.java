package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Integer> {
}
