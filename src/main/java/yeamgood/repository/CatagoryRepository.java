package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Brand;
import yeamgood.model.Catagory;

import java.util.List;

public interface CatagoryRepository extends CrudRepository<Catagory, Integer> {
    List<Catagory> findAllByActive(String acrive);
}
