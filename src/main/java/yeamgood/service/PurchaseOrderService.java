package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.PurchaseOrder;
import yeamgood.model.PurchaseOrderProduct;
import yeamgood.repository.PurchaseOrderProductRepository;
import yeamgood.repository.PurchaseOrderRepository;

import java.util.List;

@Service
@Transactional
public class PurchaseOrderService {


    @Autowired
    private PurchaseOrderRepository purchaseOrderRepository;

    @Autowired
    private PurchaseOrderProductRepository purchaseOrderProductRepository;

    public PurchaseOrder findOne(int id){
        return purchaseOrderRepository.findOne(id);
    }

    public List<PurchaseOrder> findAll(){
        return (List<PurchaseOrder>) purchaseOrderRepository.findAll();
    }

    public void save(PurchaseOrder purchaseOrder){
        PurchaseOrder purchaseOrderTemp = purchaseOrderRepository.save(purchaseOrder);

        List<PurchaseOrderProduct> purchaseOrderProductList = purchaseOrderProductRepository.findAllByPurchaseOrderID(purchaseOrderTemp.getPurchaseOrderID());
        for (PurchaseOrderProduct purchaseOrderProduct:purchaseOrderProductList){
            purchaseOrderProductRepository.delete(purchaseOrderProduct);
        }

        for (PurchaseOrderProduct purchaseOrderProduct:purchaseOrder.getPurchaseOrderProductList()){
            purchaseOrderProduct.setPurchaseOrderProductID(0);
            purchaseOrderProduct.setPurchaseOrderID(purchaseOrderTemp.getPurchaseOrderID());
            purchaseOrderProductRepository.save(purchaseOrderProduct);
        }
    }

    public void delete(PurchaseOrder purchaseOrder){
        purchaseOrderRepository.delete(purchaseOrder);
    }

}
