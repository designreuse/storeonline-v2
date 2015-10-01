package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.District;

import java.util.List;

public interface DistrictRepository extends CrudRepository<District, Integer> {
    List<District> findAllByProvinceIDAndAmphurID(int provinceID,int amphurID);
}
