package yeamgood.repository;

import org.springframework.data.repository.CrudRepository;
import yeamgood.model.Zipcode;

public interface ZipcodeRepository extends CrudRepository<Zipcode, Integer> {
    Zipcode findOneByDistrictCode(String districtCode);
}
