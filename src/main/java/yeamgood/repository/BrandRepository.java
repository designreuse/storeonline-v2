package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Brand;

import java.util.List;

public interface BrandRepository extends CrudRepository<Brand, Integer> {

    List<Brand> findAllByActive(String active);

}
