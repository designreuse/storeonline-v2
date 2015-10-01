package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Catagory;
import yeamgood.model.Unit;
import yeamgood.repository.UnitRepository;

import java.util.List;

@Service
@Transactional
public class UnitService {

    @Autowired
    private UnitRepository unitRepository;

    public Unit findOne(int id){
        return unitRepository.findOne(id);
    }

    public List<Unit> findAll(){
        return (List<Unit>) unitRepository.findAll();
    }

    public List<Unit> findAllByActive(String active){
        return (List<Unit>) unitRepository.findAllByActive(active);
    }

    public void save(Unit unit){
        unitRepository.save(unit);
    }

    public void delete(Unit unit){
        unitRepository.delete(unit);
    }

}
