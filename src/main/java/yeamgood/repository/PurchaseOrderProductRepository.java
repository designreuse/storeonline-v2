package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.PurchaseOrderProduct;

import java.util.List;

public interface PurchaseOrderProductRepository extends CrudRepository<PurchaseOrderProduct, Integer> {

    List<PurchaseOrderProduct> findAllByPurchaseOrderID(int purchaseOrderID);
}
