package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.CommonData;
import yeamgood.repository.CommonDataRepository;

import java.util.List;

@Service
@Transactional
public class CommonDataService {

    @Autowired
    private CommonDataRepository commonDataRepository;

    public CommonData findOne(int id){
        return commonDataRepository.findOne(id);
    }

    public List<CommonData> findAll(){
        return (List<CommonData>) commonDataRepository.findAll();
    }

    public void save(CommonData commonData){
        commonDataRepository.save(commonData);
    }

    public void delete(CommonData commonData){
        commonDataRepository.delete(commonData);
    }

}
