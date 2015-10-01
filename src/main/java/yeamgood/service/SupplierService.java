package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Supplier;
import yeamgood.repository.SupplierRepository;

import java.util.List;

@Service
@Transactional
public class SupplierService {

    @Autowired
    private SupplierRepository supplierRepository;

    public Supplier findOne(int id){
        return supplierRepository.findOne(id);
    }

    public List<Supplier> findAll(){
        return (List<Supplier>) supplierRepository.findAll();
    }

    public void save(Supplier supplier){
        supplierRepository.save(supplier);
    }

    public void delete(Supplier supplier){
        supplierRepository.delete(supplier);
    }
}
