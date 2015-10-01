package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Amphur;

import java.util.List;

public interface AmphurRepository extends CrudRepository<Amphur, Integer> {
    List<Amphur> findAllByProvinceID(int provinceID);
}
