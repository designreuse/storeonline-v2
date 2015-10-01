package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.PurchaseOrderProduct;
import yeamgood.model.RecieptOrderProduct;

import java.util.List;

public interface RecieptOrderProductRepository extends CrudRepository<RecieptOrderProduct, Integer> {

    List<RecieptOrderProduct> findAllByRecieptOrderID(int recieptOrderID);
}
