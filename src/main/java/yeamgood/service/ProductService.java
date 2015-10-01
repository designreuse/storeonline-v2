package yeamgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import yeamgood.model.Product;
import yeamgood.repository.ProductRepository;

import java.util.List;

@Service
@Transactional
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public Product findOne(int id){
        return productRepository.findOne(id);
    }

    public List<Product> findAll(){
        return (List<Product>) productRepository.findAll();
    }

    public void save(Product product){
        productRepository.save(product);
    }

    public void delete(Product product){
        productRepository.delete(product);
    }

}
