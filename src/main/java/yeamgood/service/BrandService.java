package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Brand;
import yeamgood.model.Unit;
import yeamgood.repository.BrandRepository;
import yeamgood.repository.UnitRepository;

import java.util.List;

@Service
@Transactional
public class BrandService {

    @Autowired
    private BrandRepository brandRepository;

    public Brand findOne(int id){
        return brandRepository.findOne(id);
    }

    public List<Brand> findAll(){
        return (List<Brand>) brandRepository.findAll();
    }

    public List<Brand> findAllByActive(String acrive){
        return (List<Brand>) brandRepository.findAllByActive(acrive);
    }

    public void save(Brand brand){
        brandRepository.save(brand);
    }

    public void delete(Brand brand){
        brandRepository.delete(brand);
    }

}
