package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.RoleUser;
import yeamgood.repository.RoleUserRepository;

import java.util.List;

@Service
@Transactional
public class RoleUserService {

    @Autowired
    private RoleUserRepository roleUserRepository;

    public RoleUser findOne(int id){
        return roleUserRepository.findOne(id);
    }

    public List<RoleUser> findAll(){
        return (List<RoleUser>) roleUserRepository.findAll();
    }

    public void save(RoleUser roleUser){
        roleUserRepository.save(roleUser);
    }

    public void delete(RoleUser roleUser){
        roleUserRepository.delete(roleUser);
    }

}
