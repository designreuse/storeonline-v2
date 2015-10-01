package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.RecieptOrderProduct;
import yeamgood.repository.RecieptOrderProductRepository;

import java.util.List;

@Service
@Transactional
public class RecieptOrderProductService {

    @Autowired
    private RecieptOrderProductRepository recieptOrderProductRepository;

    public RecieptOrderProduct findOne(int id){
        return recieptOrderProductRepository.findOne(id);
    }

    public List<RecieptOrderProduct> findAll(){
        return (List<RecieptOrderProduct>) recieptOrderProductRepository.findAll();
    }

    public List<RecieptOrderProduct> findAllByRecieptOrderID(int recieptOrderID){
        return  recieptOrderProductRepository.findAllByRecieptOrderID(recieptOrderID);
    }

    public void save(RecieptOrderProduct recieptOrderProduct){
        recieptOrderProductRepository.save(recieptOrderProduct);

    }

    public void delete(RecieptOrderProduct recieptOrderProduct){
        recieptOrderProductRepository.delete(recieptOrderProduct);
    }

}
