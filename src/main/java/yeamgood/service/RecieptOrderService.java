package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.RecieptOrder;
import yeamgood.model.RecieptOrderProduct;
import yeamgood.repository.RecieptOrderProductRepository;
import yeamgood.repository.RecieptOrderRepository;

import java.util.List;

@Service
@Transactional
public class RecieptOrderService {


    @Autowired
    private RecieptOrderRepository recieptOrderRepository;

    @Autowired
    private RecieptOrderProductRepository recieptOrderProductRepository;

    public RecieptOrder findOne(int id){
        return recieptOrderRepository.findOne(id);
    }

    public List<RecieptOrder> findAll(){
        return (List<RecieptOrder>) recieptOrderRepository.findAll();
    }

    public void save(RecieptOrder recieptOrder){
        RecieptOrder recieptOrderTemp = recieptOrderRepository.save(recieptOrder);

        List<RecieptOrderProduct> recieptOrderProductList = recieptOrderProductRepository.findAllByRecieptOrderID(recieptOrderTemp.getRecieptOrderID());
        for (RecieptOrderProduct recieptOrderProduct:recieptOrderProductList){
            recieptOrderProductRepository.delete(recieptOrderProduct);
        }

        for (RecieptOrderProduct recieptOrderProduct:recieptOrder.getRecieptOrderProductList()){
            recieptOrderProduct.setRecieptOrderProductID(0);
            recieptOrderProduct.setRecieptOrderID(recieptOrderTemp.getRecieptOrderID());
            recieptOrderProductRepository.save(recieptOrderProduct);
        }

    }

    public void delete(RecieptOrder recieptOrder){
        recieptOrderRepository.delete(recieptOrder);
    }

}
