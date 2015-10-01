package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.District;
import yeamgood.repository.DistrictRepository;

import java.util.List;

@Service
@Transactional
public class DistrictService {

    @Autowired
    private DistrictRepository districtRepository;

    public District findOne(int id){
        return districtRepository.findOne(id);
    }

    public List<District> findAll(){
        return (List<District>) districtRepository.findAll();
    }

    public List<District> findAllByProvinceIDAndAmphurID(int provinceID,int amphurID){
        return (List<District>) districtRepository.findAllByProvinceIDAndAmphurID(provinceID,amphurID);
    }
}
