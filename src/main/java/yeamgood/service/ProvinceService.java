package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Province;
import yeamgood.repository.ProvinceRepository;

import java.util.List;

@Service
@Transactional
public class ProvinceService {

    @Autowired
    private ProvinceRepository provinceRepository;

    public Province findOne(int id){
        return provinceRepository.findOne(id);
    }

    public List<Province> findAll(){
        return (List<Province>) provinceRepository.findAll();
    }
}
