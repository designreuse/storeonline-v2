package yeamgood.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.WareHouse;
import yeamgood.repository.WareHouseRepository;

import java.util.List;

@Service
@Transactional
public class WareHouseService {

    @Autowired
    private WareHouseRepository warehouseRepository;

    public WareHouse findOne(int id){
        return warehouseRepository.findOne(id);
    }

    public List<WareHouse> findAll(){
        return (List<WareHouse>) warehouseRepository.findAll();
    }

    public List<WareHouse> findAllByActive(String active){
        return (List<WareHouse>) warehouseRepository.findAllByActive(active);
    }

    public void save(WareHouse wareHouse){
        warehouseRepository.save(wareHouse);
    }

    public void delete(WareHouse wareHouse){
        warehouseRepository.delete(wareHouse);
    }

}
