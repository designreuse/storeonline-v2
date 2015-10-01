package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Zipcode;
import yeamgood.repository.ZipcodeRepository;

import java.util.List;

@Service
@Transactional
public class ZipcodeService {

    @Autowired
    private ZipcodeRepository zipcodeRepository;

    public Zipcode findOne(int id){
        return zipcodeRepository.findOne(id);
    }

    public Zipcode findOneByDistrictCode(String districtCode){
        return zipcodeRepository.findOneByDistrictCode(districtCode);
    }

    public List<Zipcode> findAll(){
        return (List<Zipcode>) zipcodeRepository.findAll();
    }
}
