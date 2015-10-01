package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Product;
import yeamgood.model.WareHouse;
import yeamgood.model.WarehouseProduct;

import java.util.List;

public interface WarehouseProductRepository extends CrudRepository<WarehouseProduct, Integer> {
    WarehouseProduct findOneByWarehouse(WareHouse warehouse);
    WarehouseProduct findOneByProduct(Product product);
    WarehouseProduct findOneByWarehouseAndProduct(WareHouse warehouse,Product product);
    List<WarehouseProduct> findAllByWarehouse(WareHouse warehouse);
    List<WarehouseProduct> findAllByProduct(Product product);
}
