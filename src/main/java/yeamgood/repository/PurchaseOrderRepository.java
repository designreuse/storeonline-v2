package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.PurchaseOrder;

public interface PurchaseOrderRepository extends CrudRepository<PurchaseOrder, Integer> {
}
