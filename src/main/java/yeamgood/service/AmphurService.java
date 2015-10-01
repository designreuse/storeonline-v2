package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Amphur;
import yeamgood.repository.AmphurRepository;

import java.util.List;

@Service
@Transactional
public class AmphurService {

    @Autowired
    private AmphurRepository amphureRepository;

    public Amphur findOne(int id){
        return amphureRepository.findOne(id);
    }

    public List<Amphur> findAll(){
        return (List<Amphur>) amphureRepository.findAll();
    }

    public List<Amphur> findAllByProvinceID(int provinceID){
        return (List<Amphur>) amphureRepository.findAllByProvinceID(provinceID);
    }
}
