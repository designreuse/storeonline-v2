package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Catagory;
import yeamgood.model.Product;
import yeamgood.repository.CatagoryRepository;

import java.util.List;

@Service
@Transactional
public class CatagoryService {

    @Autowired
    private CatagoryRepository catagoryRepository;

    public Catagory findOne(int id){
        return catagoryRepository.findOne(id);
    }

    public List<Catagory> findAll(){
        return (List<Catagory>) catagoryRepository.findAll();
    }

    public List<Catagory> findAllByActive(String active){
        return (List<Catagory>) catagoryRepository.findAllByActive(active);
    }

    public void save(Catagory catagory){
        catagoryRepository.save(catagory);
    }

    public void delete(Catagory catagory){
        catagoryRepository.delete(catagory);
    }

}
