package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.GeoGraphy;
import yeamgood.repository.GeoGraphyRepository;

import java.util.List;

@Service
@Transactional
public class GeoGraphyService {

    @Autowired
    private GeoGraphyRepository geoGraphyRepository;

    public GeoGraphy findOne(int id){
        return geoGraphyRepository.findOne(id);
    }

    public List<GeoGraphy> findAll(){
        return (List<GeoGraphy>) geoGraphyRepository.findAll();
    }
}
