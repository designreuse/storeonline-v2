package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Customer;
import yeamgood.model.Unit;
import yeamgood.repository.CustomerRepository;
import yeamgood.repository.UnitRepository;

import java.util.List;

@Service
@Transactional
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public Customer findOne(int id){
        return customerRepository.findOne(id);
    }

    public List<Customer> findAll(){
        return (List<Customer>) customerRepository.findAll();
    }

    public void save(Customer customer){
        customerRepository.save(customer);
    }

    public void delete(Customer customer){
        customerRepository.delete(customer);
    }

}
