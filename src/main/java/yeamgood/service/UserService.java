package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.User;
import yeamgood.repository.UserRepository;

import java.util.List;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User findOne(int id){
        return userRepository.findOne(id);
    }

    public List<User> findAll() {
        return (List<User>)userRepository.findAll();
    }

    public User save(User user){
        return userRepository.save(user);
    }

    public  void delete(User user){
        userRepository.delete(user);
    }

    public User findByUsername(String username){
        return userRepository.findByUsername(username);
    }

}
