package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Supplier;

public interface SupplierRepository extends CrudRepository<Supplier, Integer> {
}
