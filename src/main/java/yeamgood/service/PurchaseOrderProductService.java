package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.PurchaseOrderProduct;
import yeamgood.repository.PurchaseOrderProductRepository;

import java.util.List;

@Service
@Transactional
public class PurchaseOrderProductService {

    @Autowired
    private PurchaseOrderProductRepository purchaseOrderProductRepository;

    public PurchaseOrderProduct findOne(int id){
        return purchaseOrderProductRepository.findOne(id);
    }

    public List<PurchaseOrderProduct> findAll(){
        return (List<PurchaseOrderProduct>) purchaseOrderProductRepository.findAll();
    }

    public List<PurchaseOrderProduct> findAllByPurchaseOrderID(int purchaseOrderID){
        return (List<PurchaseOrderProduct>) purchaseOrderProductRepository.findAllByPurchaseOrderID(purchaseOrderID);
    }

    public void save(PurchaseOrderProduct purchaseOrderProduct){
        purchaseOrderProductRepository.save(purchaseOrderProduct);

    }

    public void delete(PurchaseOrderProduct purchaseOrderProduct){
        purchaseOrderProductRepository.delete(purchaseOrderProduct);
    }

}
