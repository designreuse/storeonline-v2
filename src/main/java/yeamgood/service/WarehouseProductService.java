package yeamgood.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Product;
import yeamgood.model.WareHouse;
import yeamgood.model.WarehouseProduct;
import yeamgood.repository.WarehouseProductRepository;

import java.util.List;

@Service
@Transactional
public class WarehouseProductService {

    @Autowired
    private WarehouseProductRepository warehouseProductRepository;

    public WarehouseProduct findOne(int id){
        return warehouseProductRepository.findOne(id);
    }

    public WarehouseProduct findOneByWarehouse(WareHouse warehouse){
        return warehouseProductRepository.findOneByWarehouse(warehouse);
    }

    public WarehouseProduct findOneByWarehouseAndProduct(WareHouse warehouse,Product product){
        return warehouseProductRepository.findOneByWarehouseAndProduct(warehouse,product);
    }

    public List<WarehouseProduct> findAll(){
        return (List<WarehouseProduct>) warehouseProductRepository.findAll();
    }

    public List<WarehouseProduct> findAllByWarehouse(WareHouse warehouse){
        return (List<WarehouseProduct>) warehouseProductRepository.findAllByWarehouse(warehouse);
    }

    public List<WarehouseProduct> findAllByProduct(Product product){
        return (List<WarehouseProduct>) warehouseProductRepository.findAllByProduct(product);
    }

    public void save(WarehouseProduct wareHouse){
        warehouseProductRepository.save(wareHouse);
    }

    public void delete(WarehouseProduct wareHouse){
        warehouseProductRepository.delete(wareHouse);
    }


    public void saveWarehouseProduct(List<WarehouseProduct> warehouseProductList){
        WarehouseProduct warehouseProductTmp;
        for (WarehouseProduct warehouseProduct:warehouseProductList){
            warehouseProductTmp = new WarehouseProduct();
            warehouseProductTmp = warehouseProductRepository.findOneByWarehouseAndProduct(warehouseProduct.getWarehouse(),warehouseProduct.getProduct());
            if(warehouseProductTmp == null){
                warehouseProductRepository.save(warehouseProduct);
            }else{
                int unitInStock = warehouseProductTmp.getUnitsInStock() + warehouseProduct.getUnitsInStock() ;
                warehouseProductTmp.setUnitsInStock(unitInStock);
                warehouseProductRepository.save(warehouseProductTmp);
            }
        }
    }

}
